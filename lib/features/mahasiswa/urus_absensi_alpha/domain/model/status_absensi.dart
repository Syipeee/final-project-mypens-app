enum StatusAbsensi {
  izin, sakit, hadir;

  @override
  String toString(){
    switch(this){
      case izin:
        return 'Izin';
      case sakit:
        return 'Sakit';
      case hadir:
        return 'Hadir';
    }
  }
}