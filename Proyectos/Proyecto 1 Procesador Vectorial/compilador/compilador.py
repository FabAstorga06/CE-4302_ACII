#####################################################
#                                                   #
#      Compialdor Python para ISA vectorial         #
#                                                   #
#####################################################

import binascii  #Se agregan paquetes necesarios

#Lista con las instrucciones del ISA
instructionList = ["NOP","SUMV","RESV","LOADV","STOREV","XOR","SLL","SRL","SLLC","SRLC",
                   "SUM","RES","MOV","VFS","LPC","SPC"];
#Lista con el codigo de operacion de la instruccion
opcodeList = ["0000","0001","0010","0011","0100","0101","0110","0111",
              "1000","1001","1010","1011","1100","1101","1110","1111"];

#Lista con el tipo de instruccion. 0 para generales, 1 para load/store y mov, 2 para vfs
formatList = [0,0,0,1,1,0,0,0,0,0,0,0,2,2,2,2];

#Tabla con todos las instrucciones a escribir
instructionTable = [];

NOP = "00000000000000";


############################################################
#funcion que agrega los ceros necesarios para los registros en la instruccion en binario
def agregaCeros(reg,num):
    ceros = ""
    while len(ceros) < (num-len(bin(int(reg))[2:])): #Mientras el numero final sea menor al necesario
        ceros += "0"
    reg = ceros + bin(int(reg))[2:];  #Agrega ceros necesarios del registro
    return reg

############################################################
#funcion para obtener el opcode
def opCodeOptain(opcode):
    binary="";
    n = 0
    for i in instructionList: #para cada elemento en la lista
        if opcode == i:       # Verifica el OPCode
            binary += opcodeList[n];
            break;
        n += 1;
    return [binary,n];

############################################################

def binario(instruction):
    salida = opCodeOptain(instruction[0].upper());
    opcode = salida[0];
    n = salida[1];
    dest = "";    
    if(len(instruction)==4):                             # verifica la cantidad de argumentos
        if(formatList[n] == 0):                          # tipo general
            dato1 = "";
            dato2 = "";
            indice1 = 1;
            indice2 = 1;
            dest = agregaCeros(instruction[1][2:],4);
            if (n < 3):                                  # operaciones Vector-Vector
                if(len(instruction[2]) < 3 or len(instruction[3]) < 3):
                    print("La instrucción " + instruction[0] + " necesita registros vectores");
                    return -1;
                else:
                    dato1 = agregaCeros(instruction[2][2:],3);
                    dato2 = agregaCeros(instruction[3][2:],3);
                return(opcode+dest+dato1+dato2);
            else:
                if(len(instruction[2]) == 3):           # verifica si el registro es vectorial
                    indice1 = 2;
                if(len(instruction[3]) == 3):           # verifica si el registro es vectorial
                    indice2 = 2;
                dato1 = agregaCeros(instruction[2][indice1:],3);
                dato2 = agregaCeros(instruction[3][indice2:],3);
                return(opcode+dest+dato1+dato2);
        else:
            return -1;

    elif(len(instruction)==3):
        reg = "";
        dir_mem = "";
        dir_mem = agregaCeros(int(instruction[2][2:],16),8); #se pasa la direccion hexa a binario
        if(formatList[n] == 1): # load/store y MOV
            dir_mem = agregaCeros(int(instruction[2][2:],16),8); #se pasa la direccion hexa a binario
            reg = agregaCeros(instruction[1][2:],2);
            return(opcode+reg+dir_mem);            
        elif(formatList[n] == 2):
            dest = agregaCeros(instruction[1][1:],2); # en ese caso dir_mem es un inmediato
            return(opcode+dest+dir_mem);
        else:
            return -1;

    elif(len(instruction)==2):
        if(formatList[n] == 2):    # VFS, LPC y SPC
            dest = agregaCeros(instruction[1][2:],3); # dest para VFS, reg para PPC y SCP
            return(opcode+dest+"0000000");
        else:
            return -1;
    elif(instruction[0] == "NOP"):
        return(NOP);        
    else:
        return -1;

#############################################################
#Agrega NOPS para eliminar riesgos

def riesgos(instructionTable):
    i = 0;  #indice de la lista    
    while(i < len(instructionTable)):  #mientras el indice sea mejor al largo de la lista        
        if((i+1) < len(instructionTable)):
            if((instructionTable[i][0] == "MOV") and (instructionTable[i+1][0] == "VFS" )):                
                instructionTable.insert(i+1,["NOP"]);
                i = i+1;
            elif(instructionTable[i][0] == "VFS"):                
                instructionTable.insert(i,["NOP"]);
                i = i+1;             
            elif(len(instructionTable[i+1]) == 2):
                if((instructionTable[i][1] == instructionTable[i+1][1])):
                    instructionTable.insert(i+1,["NOP"]);
                    i = i+1;
            elif(len(instructionTable[i+1]) == 3):                
                if((instructionTable[i][1] == instructionTable[i+1][2])):
                    instructionTable.insert(i+1,["NOP"]);
                    i = i+1;
            elif(len(instructionTable[i+1]) == 4):
                if((instructionTable[i][1] == instructionTable[i+1][2]) or (instructionTable[i][1] == instructionTable[i+1][3])):
                    instructionTable.insert(i+1,["NOP"]);                    
                    i = i+1;              
        i = i+1;

#############################################################
#Agrega las instrucciones a una tabla para verificar errores

def agrega(instruction,line):
    if(len(instruction) < 1):
        return -1;
    else:
        instruction = instruction.split(";");                 # se revisan comentarios
        instruction = instruction[0].replace("\t","");        # se eliminan los \t
        instruction = instruction.replace(" ","").split(","); #se eliminan espacios en blanco y se separa en lista.
        j = 0;
        for i in instruction:
            instruction[j] = i.replace("\n","");
            j += 1;
        if(instruction[0] == "" or instruction[0] == "\n"):   # omite los \n y comentarios
            return 1;
        if(len(instruction) > 4):                             # error en la instruccion
            instructionTable.append(instruction)
            print("Error del codigo fuente en la linea: " + str(line))
            return -1;
        else:
            instructionTable.append(instruction)

#############################################################
#Generacion de mif

def mif(origen,destino,DEPTH):
    WIDTH = 14;
    with open(destino, 'w', encoding="utf8") as archive:
        print("-- Memory Initialization File", file=archive);
        print(("\nDEPTH = "+ str(DEPTH) +";"), file=archive);
        print("WIDTH = 14;", file=archive);
        print("\nADDRESS_RADIX = UNS;", file=archive);
        print("DATA_RADIX = BIN;", file=archive);
        print("\nCONTENT BEGIN", file=archive);
        with open(origen, encoding="utf8") as file: #Abre y lee el archivo
            contador = 0;
            for line in file:
                print((str(contador) + " : " + line[:14] + ";"), file=archive);
                contador += 1;

        print("END;", file=archive);


#############################################################
#Lectura y escritura de archivo

def write(instructionTable,target):      #Escritura de archivo    
    if(riesgos(instructionTable) == -1): #Si los riesgos retorna -1 es que hay errores
        print("error en el codigo fuente.") 
        return -1;
    else:        
        size = 0;
        with open(target, 'w', encoding="utf8") as archive:
            for element in instructionTable: #Revisa la tabla para convertir a binario                
                test = binario(element);     #Agrega los datos en binario                
                if(test != -1):
                    size += 1;
                    print(binario(element), file=archive);                    
                else:
                    print("Error en el codigo fuente");
                    return -1;
        print("Compilación en binario con exito, generando mif");
        mif('program.bin','program.mif',size);
        #print("Finalizado con exito");
        #print(size);

#############################################################
#Lectura del archivo de origen

def read(source,target): #Lee el archivo origen
    cont = 1;
    error = False;
    with open(source, encoding="utf8") as archive: #Abre y lee el archivo
        for line in archive:
            if (agrega(line,cont) == -1):
                error = True;
                cont = cont + 1;
    if(error == False): #Si no da error continua
        write(instructionTable,target);
        print("Finalizado con exito");


read('code1.txt','program.bin')
