
SAMPLES = ["A1","A2","A3","A4"]

ALL_FASTQC_ZIP = expand("FASTQC/{sample}_fastqc.zip", sample = SAMPLES)
ALL_FASTQC_HTML = expand("FASTQC/{sample}_fastqc.html", sample = SAMPLES)

rule all:
	input: ALL_FASTQC_ZIP + ALL_FASTQC_HTML

rule fastqc:
	input: "RAWDATA/{sample}.fastq.gz"
	output: "FASTQC/{sample}_fastqc.zip", "FASTQC/{sample}_fastqc.html"
	benchmark: "benchmark/fastqc/{sample}.bench"
	#params:	rg="anything"
	threads: 1
	log:	"logs/fastqc/{sample}.log"
	shell: 	
		"fastqc -o FASTQC {input} &>{log}"

