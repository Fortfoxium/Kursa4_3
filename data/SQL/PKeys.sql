alter table USLUGA add primary key (ID_Med_Usl);
commit;
alter table CABINET add primary key (Cab);
commit;
alter table PROJIVANIE add primary key (ID_Proj);
commit;
alter table DOCTOR add primary key (ID_DOCTOR);
commit;
alter table PACIENT add primary key (ID_PACIENT);
commit;
alter table TALON add primary key (ID_Talon);
commit;

