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

// how many data per row in the output
#define PER_ROW 8

// table name
#define NAME "sin_table"

int main(int argc,char *argv[]) {

	int i;
	int n=N,ampl=AMPL,mul=MUL,per_row=PER_ROW;
	char name[20]=NAME;

	if ((argc>1) && (!strcmp(argv[1],"-h"))) {
		printf("\nCreates a sin table for VASM 68K Assembler.\n\n");
		printf("use:\n	$ make_sin_table n ampl mul per_row name\n");
		printf("input:\n");
		printf("	n	wavelength in bytes (default: 256)\n");
		printf("	ampl	amplitude (default: 64)\n");
		printf("	mul	multiplier (default: 128)\n");
		printf("	per_row	data per row in the output (default: 8)\n");
		printf("	name	table name (default: sin_table)\n\n");

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
		strcpy(name,argv[5]);

	printf("%s:\n",name);
	// print some information about the sinus
	printf("; sinus wave with wavelength %d, amplitude %d x %d\n",n,ampl,mul);
	
	// start the data
	printf("   dc.w ");
	for (i=0; i<n; i++) {
		int s=((int)(sin(i*M_PI*2/n)*ampl))*mul;	
		printf("%5d",s);
		if (i==n-1)
			printf("\n");
		else if ((i & (per_row-1))==per_row-1)
			printf("\n   dc.w ");
		else
			printf(", ");

	}
	return 0;

}

