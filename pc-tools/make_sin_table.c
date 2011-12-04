/*
A sin table creator for VASM 68K Assembler.
By Antti Silvast 2011.

To compile:
  gcc -lm -o make_sin_table make_sin_table.c

Type make_sin_table -h for help.
*/

#include <stdio.h>
#include <string.h>
#include <math.h>

// default parameters
// wavelength
#define N 256
// amplitude
#define AMPL 64
// multiplier
#define MUL 128 // for row-based sins

// how many datas per row in the output
#define PER_ROW 8

// data type
#define TYPE "dc.w"

// table name
#define NAME "sin_table"

int main(int argc,char *argv[]) {

	int i;
	int n=N,ampl=AMPL,mul=MUL,per_row=PER_ROW;
	char name[20]=NAME;
	char type[20]=TYPE;

	if ((argc>1) && (!strcmp(argv[1],"-h"))) {
		printf("\nCreates a sin table for VASM 68K Assembler.\n\n");
		printf("use:\n	$ make_sin_table n ampl mul per_row type name\n");
		printf("input:\n");
		printf("	n	wavelength in bytes (default: %d)\n",n);
		printf("	ampl	amplitude (default: %d)\n",ampl);
		printf("	mul	multiplier (default: %d)\n",mul);
		printf("	per_row	data per row in output (default: %d)\n",per_row);
		printf("	type	dc.b (byte), dc.w (word) (default: %s)\n",type);
		printf("	name	table name (default: %s)\n\n",name);

		return 0;
	}

	if (argc>1) 
		sscanf(argv[1],"%d",&n);
	if (argc>2) 
		sscanf(argv[2],"%d",&ampl);
	if (argc>3) 
		sscanf(argv[3],"%d",&mul);
	if (argc>4) 
		sscanf(argv[4],"%d",&per_row);
	if (argc>5)
		strcpy(type,argv[5]);
	if (argc>6)
		strcpy(name,argv[6]);

	printf("%s:\n",name);
	// print some information about the sinus
	printf("; sinus wave with wavelength %d, amplitude %d x %d\n",n,ampl,mul);
	
	// start the data
	printf("   %s ",type);
	for (i=0; i<n; i++) {
		int s=((int)(sin(i*M_PI*2/n)*ampl))*mul;	
		printf("%5d",s);
		if (i==n-1)
			printf("\n");
		else if ((i & (per_row-1))==per_row-1)
			printf("\n   %s ",type);
		else
			printf(", ");

	}
	return 0;

}

