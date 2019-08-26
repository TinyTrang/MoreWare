NUMBERS = 45294525253 691504953301 852243253933 50327132081869 204392534337661 195977013025033 764797938094213 840977118824881 227992999057729 785181164768269 3460290975330649 53008983463092301 205781884683513421 271713540820172173 4445131267109549113 888454193595016861 231023589531543769 915276330581185789 1008559420525856281

default: factor

factor:
	nvcc factor.cu -o factor -O3 -lcudart
factor-mp:
	nvcc factor.cu -o factor-mp -O3 -lcudart -Xcompiler -fopenmp

benchmark: |factor
	./factor 256 256 $(NUMBERS)
benchmark-mp: |factor-mp
	./factor-mp 256 256 $(NUMBERS)


clean:
	rm -f factor
	rm -f factor-mp