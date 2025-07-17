clear all
close all
clc

datos

[t,x]=meulermod(f,intervalo,x0,N);

graficas(t,x)