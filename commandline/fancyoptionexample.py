#!/usr/bin/python

import sys
import getopt

###OPTIONAL
def usage():
    '''
    usage()

    demonstrates use of command line option flags in a program
    '''

    print("-" * 70)
    print("This short program is intended to demonstrate")
    print("one way to handle command line options within a python program.")
    print("Usage:")
    print("    python fancyoptionexample.py")
    print("                   -i, --option_i=one option")
    print("                   -f, --anotheroption=another option")
    print("where:")
    print("    option_i          : one option has the -i flag")
    print("    anotheroption     : the other option uses the -f flag")
    print("-" * 70)


##NEED THIS FUNCTION TO COLLECT COMMAND LINE ARGUMENTS
def parseArguments():

    global option1
    global anotheroption

    #collect the values associated with each flag; if this fails (except) then print the usage statement
    try:
        opts, args = getopt.getopt(sys.argv[1:],"i:f:",["option_i=",\
                                                         "anotheroption="])
        
    except getopt.GetoptError, error:
        sys.stderr.write("Error: %s\n" %error)
        usage()
        sys.exit(2)

    #if no options were retrieved then print the usage information
    if opts == []:
         # print help information and exit
         usage()
         sys.exit(2)
    
    #go through the list of options and set the appropriate variables to the values that were passed
    for option, value in opts:
        if option in ("-i", "--option_i"):
            option1 = value
        if option in ("-f", "--anotheroption"):
            anotheroption = value

    # check to see whether the flags were set. Here, only option1 is required so we don't check the value
    # of anotheroption

    if option1 is None:
        raise ValueError("amplicon name cannot be None")


##program starts running here, first getting the variables it needs

option1 = None
anotheroption = None

parseArguments()

print(option1)
print(anotheroption)
