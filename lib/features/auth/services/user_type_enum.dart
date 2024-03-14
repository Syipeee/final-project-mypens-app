enum UserType {
  dosen(3), mahasiswa(1), staff(2), unknown(-1);

  final int typeId;
  const UserType(this.typeId);
}