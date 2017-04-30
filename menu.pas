program tubes;

uses sysutils;

type
	nilaiTukar = record
		nilaiKursAsal : longint;
		kursAsal : string;
		nilaiKursTujuan : longint;
		kursTujuan : string;
	end;
	pembelian = record
		nomorAkun : string;
		jenisBarang : string;
		penyedia : string;
		nomorTujuan : string;
		mataUang : string;
		jumlah : longint;
		saldo : string;
		tanggalTransaksi : string; 
	end;
	pembayaran = record
		nomorAkun : string;
		jenisTransaksi : string;
		rekeningBayar : string;
		mataUang :string;
		jumlah : longint;
		saldo : longint;
		tanggalTransaksi : string;
	end;
	transfer = record
		nomorAkunAsal : string;
		nomorAkuntujuan : string;
		jenisTransfer : string;
		namaBankLuar : string;
		mataUang : string;
		jumlah : longint;  
		saldo : longint;  
		tanggalTransaksi : string ;  
	end;
	setoran = record
		nomorAkun : string;
		jenisTransaksi : string;
		mataUang : string;
		jumlah : longint;
		saldo : longint; 
		tanggalTransaksi : string;
	end;
	rekening = record
		nomorAkun : string;
		nomorNasabah : string;
		jenisrekening : string;
		mataUang : string;
		saldo : longint;
		setoranRutin : string;
		rekeningAutodebet : string;
		jangkaWaktu : string; 
		tanggalMulai : string; 
	end;
	nasabah = record
		nomorNasabah : string;
		namaNasabah : string;
		alamat : string;
		kota : string;
		email : string;
		nomorTelp : string;
		username : string;
		password : string;
		status : string;
	end;
	listNasabah = record
		nasabah : array [1..100] of nasabah;
		neff : integer;
	end;
	listRekening = record
		rekening : array [1..200] of rekening;
		neff : integer;
	end;
	listSetoran = record
		setoran : array [1..400] of setoran;
		neff : integer;
	end;
	listTransfer = record
		transfer : array [1..400] of transfer;
		neff : integer;
	end;
	listPembayaran = record
		pembayaran : array [1..400] of pembayaran;
		neff : integer;
	end;
	listPembelian = record
		pembelian : array [1..400] of pembelian;
		neff : integer;
	end;
	listNilaiTukar = record
		nilaiTukar : array [1..400] of nilaiTukar;
		neff : integer;
	end;
	
var
	fNasabah : file of  nasabah;
	varNasabah : nasabah;
	fRekening : file of  rekening;
	varRekening : rekening;
	fSetoran : file of setoran;
	varSetoran : setoran;
	fTranfer : file of transfer;
	varTransfer : transfer;
	fPembayaran : file of pembayaran;
	varPembayaran : pembayaran;
	fPembelian : file of pembelian;
	varPembelian : pembelian;
	fNilaiTukar : file of nilaiTukar;
	varNilaiTukar : nilaiTukar;
	lNasabah : listNasabah;
	lRekening : listRekening;
	lSetoran : listSetoran;
	lTransfer : listTransfer;
	lPembayaran : listPembayaran;
	lPembelian : listPembelian;
	lNilaiTukar : listNilaiTukar;
	
procedure load(var ln : listNasabah; lr : listRekening; ls : listSetoran; lt : listTransfer; lbyr : listPembayaran; lbeli : listPembelian; lnt : listNilaiTukar);
var
	fn : file of nasabah;
	fr : file of rekening;
	fs : file of setoran;
	ft : file of transfer;
	fbyr : file of pembayaran;
	fbeli : file of pembelian;
	fnt : file of nilaiTukar;
	namaFile : string;
	n : nasabah;
	r :rekening;
	s : setoran;
	t : transfer;
	byr : pembayaran;
	beli : pembelian;
	nt : nilaiTukar;
	i : integer;
	loop : boolean;
	a : integer;
	
begin
	loop := true;
	while loop do
	begin
		writeln('> 1. Nasabah');
		writeln('> 2. Rekening');
		writeln('> 3. Setoran');
		writeln('> 4. Transfer');
		writeln('> 5. Pembayaran');
		writeln('> 6. Pembelian');
		writeln('> 7. Nilai tukar');
		writeln('> 8. Exit load');
		write('> masukkan angka untuk menge-load file sesuai jenis:');
		readln(a);
		case a of
			1 :
				begin
					i :=1;
					writeln('> File nasabah');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fn,namaFile);
					reset(fn);
					ln.neff := 0;
					while (not eof(fn)) and (i>=201) do
					begin
						read(fn,n);
						ln.nasabah[i] := n;
						i:=i+1;
						ln.neff := ln.neff +1;
					end;
					writeln('> pembacaan file selesai');
				end;
			2 :
				begin
					lr.neff := 1;
					i :=1;
					writeln('> File rekening');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fr,namaFile);
					reset(fr);
					while (not eof(fr)) and (i>=201) do
					begin
						read(fr,r);
						lr.rekening[i] := r;
						i:=i+1;
						lr.neff := lr.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			3 :
				begin
					i :=1;
					writeln('> File setoran');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fs,namaFile);
					ls.neff := 1;
					reset(fs);
					while (not eof(fs)) and (i>=401) do
					begin
						read(fs,s);
						ls.setoran[i] := s;
						i:=i+1;
						ls.neff:=ls.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			4 :
				begin
					i :=1;
					writeln('> File transfer');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(ft,namaFile);
					lt.neff := 1;
					reset(ft);
					while (not eof(ft)) and (i>=401) do
					begin
						read(ft,t);
						lt.transfer[i] := t;
						i:=i+1;
						lt.neff := lt.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			5 :
				begin
					i :=1;
					writeln('> File pembayaran');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fbyr,namaFile);
					lbyr.neff := 1;
					reset(fbyr);
					while (not eof(fbyr)) and (i>=401) do
					begin
						read(fbyr,byr);
						lbyr.pembayaran[i] := byr;
						lbyr.neff := lbyr.neff+1;
						i:=i+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			6 :
				begin
					i :=1;
					writeln('> File pembelian');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fbeli,namaFile);
					lbeli.neff := 1;
					reset(fbeli);
					while (not eof(fbeli)) and (i>=401) do
					begin
						read(fbeli,beli);
						lbeli.pembelian[i] := beli;
						i:=i+1;
						lbeli.neff:=lbeli.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			7 :
				begin
					i :=1;
					writeln('> File nilai tukar');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fnt,namaFile);
					lnt.neff := 1;
					reset(fnt);
					while (not eof(fnt)) and (i>=401) do
					begin
						read(fnt,nt);
						lnt.nilaiTukar[i] := nt;
						i:=i+1;
						lnt.neff:=lnt.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			8 :
				begin
					loop := false;
				end;
		end;
	end;
end;

procedure exitProgram (ln : listNasabah; lr : listRekening; ls : listSetoran;lt : listTransfer;lbyr : listPembayaran;lbeli : listPembelian;lnt : listNilaiTukar);
var
	fn : file of nasabah;
	fr : file of rekening;
	fs : file of setoran;
	ft : file of transfer;
	fbyr : file of pembayaran;
	fbeli : file of pembelian;
	fnt : file of nilaiTukar;
	namaFile : string;
	n : nasabah;
	r :rekening;
	s : setoran;
	t : transfer;
	byr : pembayaran;
	beli : pembelian;
	nt : nilaiTukar;
	i : integer;
	loop : boolean;
begin
	assign(fn,'nasabah.txt');
	rewrite(fn);
	i:=1;
	while (i<=ln.neff) do
	begin
		n:= ln.nasabah[i];
		write(fn,n);
		i:= i+1;
	end;
	close(fn);
	assign(fr,'rekening.txt');
	rewrite(fr);
	i:=1;
	while (i <= lr.neff) do
	begin
		r:= lr.rekening[i];
		write(fr,r);
		i:= i+1;
	end;
	close(fr);
	assign(ft,'transfer.txt');
	rewrite(ft);
	i:=1;
	while (i <= lt.neff) do
	begin
		t:= lt.transfer[i];
		write(ft,t);
		i:= i+1;
	end;
	close(fr);
	assign(fbyr,'pembayaran.txt');
	rewrite(fbyr);
	i:=1;
	while (i <= lbyr.neff) do
	begin
		byr:= lbyr.pembayaran[i];
		write(fbyr,byr);
		i:= i+1;
	end;
	close(fbyr);
	assign(fbeli,'pembelian.txt');
	rewrite(fbeli);
	i:=1;
	while (i <= lbeli.neff) do
	begin
		beli:= lbeli.pembelian[i];
		write(fbeli,beli);
		i:= i+1;
	end;
	close(fbeli);
	assign(fs,'setoran.txt');
	rewrite(fs);
	i:=1;
	while (i <= ls.neff) do
	begin
		s:= ls.setoran[i];
		write(fs,s);
		i:= i+1;
	end;
	close(fs);
	assign(fnt,'nilai tukar.txt');
	rewrite(fnt);
	i:=1;
	while (i <= lnt.neff) do
	begin
		nt:= lnt.nilaiTukar[i];
		write(fnt,nt);
		i:= i+1;
	end;
	close(fnt);
end;

procedure tulisMenu;
begin
	writeln('> menu:');
	writeln;
	writeln('> 1. load ');
	writeln('> 2. login');
	writeln('> 3. lihatRekening ');
	writeln('> 4. informasiSldo ');
	writeln('> 5. lihatAktivitasTransaksi ');
	writeln('> 6. pembuatanRekening ');
	writeln('> 7. setoran ');
	writeln('> 8. penarikan ');
	writeln('> 9. transfer ');
	writeln('> 10. pembayaran ');
	writeln('> 11. pembelian ');
	writeln('> 12. penutupanRekening ');
	writeln('> 13. perubahanDataRekening ');
	writeln('> 14. penambahanAutoDebet ');
	writeln('> 15. exit ');
end;

procedure menu;
var
	loop : boolean;
	a : integer;
begin
	tulisMenu;
	write('masukkan angka sesual dengan perintahnya');
	readln(a);
	case a of
		1 :
			begin
				load(lNasabah, lRekening, lSetoran, lTransfer, lPembayaran, lPembelian, lNilaiTukar);
			end;
		2 :
			begin
			end;
		3 :
			begin
			end;
		4 :
			begin
			end;
		5 :
			begin
			end;
		6 :
			begin
			end;
		7 :
			begin
			end;
		8 :
			begin
			end;
		9 :
			begin
			end;
		10 :
			begin
			end;
		11 :
			begin
			end;
		12 :
			begin
			end;
		13 :
			begin
			end;
		14 :
			begin
			end;
		15 :
			begin
				exitProgram(lNasabah, lRekening, lSetoran, lTransfer, lPembayaran, lPembelian, lNilaiTukar);
			end;
	end;
end;
{program utama}
begin
	menu; 
end.
