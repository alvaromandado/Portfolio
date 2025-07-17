clear all
close all
clc

datos

[t,x]=mrk4(f,intervalo,x0,N);

graficas(t,x)