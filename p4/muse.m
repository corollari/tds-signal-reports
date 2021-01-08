hold on 
mu = 1e-5
  [Hf, y, e]=algoritmeLMS(filtered, RxSignal, 60, mu);
  notch=resp(1)
  it=zeros(5,1)
  it(1)= Hf(60,10)-notch
  it(2)=Hf(60,100)-notch
  it(3)=Hf(60,500)-notch
  it(4)=Hf(60,2000)-notch
  it(5)=Hf(60,end)-notch
  plot([10, 100, 500, 2000, length(Hf)], abs(it))
  mu = 1e-4
  [Hf, y, e]=algoritmeLMS(filtered, RxSignal, 60, mu);
  notch=resp(1)
  it=zeros(5,1)
  it(1)= Hf(60,10)-notch
  it(2)=Hf(60,100)-notch
  it(3)=Hf(60,500)-notch
  it(4)=Hf(60,2000)-notch
  it(5)=Hf(60,end)-notch
  plot([10, 100, 500, 2000, length(Hf)], abs(it))
  mu = 1e-8
  [Hf, y, e]=algoritmeLMS(filtered, RxSignal, 60, mu);
  notch=resp(1)
  it=zeros(5,1)
  it(1)= Hf(60,10)-notch
  it(2)=Hf(60,100)-notch
  it(3)=Hf(60,500)-notch
  it(4)=Hf(60,2000)-notch
  it(5)=Hf(60,end)-notch
  plot([10, 100, 500, 2000, length(Hf)], abs(it))