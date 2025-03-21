import 'package:app/data/1.dart';

List<money> geter(){
  money upwork = money();
  upwork.name = 'Pollo Brujo';
  upwork.fee = '350';
  upwork.time = 'Hoy';
  upwork.image = 'food.png';
  upwork.buy = true;
  money tecdesoft = money();
  tecdesoft.name = 'Tecnologico De Software';
  tecdesoft.fee = '4200';
  tecdesoft.time = 'Ayer';
  tecdesoft.image ='Education.png';
  tecdesoft.buy = true;
  money transferencia = money();
  transferencia .buy = false;
  transferencia .fee = '200';
  transferencia .image ='transfer.png';
  transferencia .name = 'Caliente MX Deposito carrera de perros';
  transferencia .time = 'Marzo 1, 2025';
  money Ps_Store = money();
  Ps_Store.name = 'God Of War Ragnarok';
  Ps_Store.fee = '700';
  Ps_Store.time = 'Diciembre 24, 2025';
  Ps_Store.image = 'Enterteinment.png';
  Ps_Store.buy = true;


 return [upwork, tecdesoft, transferencia, Ps_Store];
}