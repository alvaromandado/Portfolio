clear all
close all
clc

datos

[t,x]=meuler(f,intervalo,x0,N);

graficas(t,x)