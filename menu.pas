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
		setoranRutin : longint;
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
	noNasabah : string;
	urutanNasabah : integer;

function jatuhtempo(R : Rekening):Boolean;
{Mencari tahu apakah akun sudah jatuh tempo atau belum}

begin
	jatuhtempo := false;
		if (R.jangkaWaktu = '1 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>30) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '3 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>90) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '6 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>180) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '12 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>365) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '1 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>365) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '2 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>730) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '3 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>1095) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '4 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>1460) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '5 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>1875) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '6 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>2190) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '7 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>2555) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '8 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>2920) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '9 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>3285) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '10 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>3650) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '11 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>4015) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '12 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>4380) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '13 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>4745) then jatuhtempo:=True;
			end else			
		if (R.jangkaWaktu = '14 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>5110) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '15 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>5475) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '16 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>5840) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '17 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>6205) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '18 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>6570) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '19 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>6935) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '20 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>7300) then jatuhtempo:=True;
			end else		
end;

	
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
		write('> masukkan angka untuk menge-load file sesuai jenis: ');
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
					lr.neff := 0;
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
					ls.neff := 0;
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
					lt.neff := 0;
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
					lbyr.neff := 0;
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
					lbeli.neff := 0;
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
					lnt.neff := 0;
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



procedure penambahanAutoDebet(noNasabah : string; var  lr : listRekening);
var
	found1, found2 : boolean;
	nomandiri, noauto,lna, jenis : string;
	i,b : integer;
	
begin
	found1 := false;
	found2 := false;
	writeln('> tuliskan nomor rekening yang mau diberi/diubah autodebetnya : ');
	readln(noauto);
	write('> tuliskan rekening mandiri yang mau dijadikan autodebet : ');
	readln(nomandiri);
	i := 1;
	while (not found1) and (not found2) and (i<=lr.neff) do
	begin
		lna:= lr.rekening[i].nomorAkun;
		jenis:= lr.rekening[i].jenisRekening;
		if (lna=noauto) and ((jenis = 'tabungan rencana') or (jenis = 'deposito')) then
		begin
			found1 := true;
			b:=i;
		end;
		if (lna=nomandiri) and (jenis = 'tabungan mandiri') then
		begin
			found2 := true;
		end;
		i := i+1;
	end;
	if found1 and found2 then
	begin
		lr.rekening[b].rekeningAutodebet := nomandiri;
	end
	else
	begin
		writeln('> perintah tidak bisa dilakukan karena nomor rekening tidak ada');
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

procedure buatRekening(NoNasabah : string; var R : ListRekening);

{Kamus lokal}
var	
	chs,n,jw	: integer;
	saldo,setoran	: longint;
	rekAuto		: string;
	i		: integer;
{Algoritma Prosedur}
begin
writeln('> Buat Rekening');
repeat 
	writeln('> Pilih jenis rekening yang akan dibuat :');
	writeln('> 1. Tabungan Mandiri');
	writeln('> 2. Tabungan Rencana');
	writeln('> 3. Deposito');
	write('> Jenis rekening: ');
	readln(chs);
	writeln('>');
until (chs>0)and(chs<4);
case chs of
	1 : begin
		repeat
			writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal Rp 50.000');
			write('> Masukkan setoran awal : Rp ');
			readln(saldo);
		until (saldo>=50000);	
		n := R.Neff+1;
		R.rekening[n].nomorAkun := '1XY0'+IntToStr(n);
		R.rekening[n].nomorNasabah := NoNasabah;
		R.rekening[n].jenisrekening := 'tabungan mandiri';
		R.rekening[n].mataUang := 'IDR';
		R.rekening[n].saldo := saldo;
		R.rekening[n].setoranrutin := 0;
		R.rekening[n].rekeningAutodebet := '-';
		R.rekening[n].jangkaWaktu := '-';
		R.rekening[n].tanggalMulai := DateToStr(Date);
		end;	
	2 : begin
		n := R.Neff+1;
		write('> Masukkan setoran awal : Rp ');
		readln(saldo);
		if (saldo<0) then 
		begin
			repeat
				writeln('> Masukkan angka  >= 0');
				write('> Masukkan setoran awal : Rp ');
				readln(saldo);
			until (saldo>=0);
		end;
		writeln('> Silahkan tentukan setoran bulanan yang Anda inginkan');
		repeat
			writeln('> Minimal Rp 500.000');
			write('> Masukkan jumlah setoran bulanan : Rp ');
			readln(setoran);
		until (setoran>=500000);
		i := 1;
		rekAuto := '-';
		while (i<n) and (rekAuto = '-') do
		begin
			if (R.rekening[i].nomorNasabah=R.rekening[n].nomorNasabah) and (R.rekening[i].jenisrekening = 'tabungan mandiri') then
			begin
				rekAuto := R.rekening[i].nomorAkun
			end;
			i:=i+1;
		end;
	
		writeln('> Silahkan tentukan jangka waktu tabungan yang Anda inginkan');
		repeat
			writeln('> Minimal 1 tahun');
			writeln('> Maksimal 20 tahun');
			write('> Jangka waktu tabungan dalam tahun: ');
			readln(jw);
		until (jw>=1)and(jw<=20);
				
		R.rekening[n].nomorAkun := '2XY0'+IntToStr(n);
		R.rekening[n].nomorNasabah := NoNasabah;
		R.rekening[n].jenisrekening := 'tabungan rencana';
		R.rekening[n].mataUang := 'IDR';
		R.rekening[n].saldo := saldo;
		R.rekening[n].setoranrutin := setoran;
		R.rekening[n].rekeningAutodebet := rekAuto;
		R.rekening[n].jangkaWaktu := IntToStr(jw)+' tahun';
		R.rekening[n].tanggalMulai := DateToStr(Date);
		end;
	3 : begin
		n :=R.Neff+1;
		writeln('> Kami menyediakan tiga jenis mata uang yang dapat anda gunakan :');
		writeln('> 1. IDR');
		writeln('> 2. USD');
		writeln('> 3. EUR');
		write('> Pilih mata uang yang ingin anda gunakan : ');
		readln(chs);
		while (chs<1)or(chs>3) do 
		begin
			writeln('> Masukkan angka 1-3');
			write('> Pilih mata uang yang ingin anda gunakan : ');
			readln(chs);
		end;
		case chs of
		1 : begin
			R.rekening[n].mataUang := 'IDR';
			repeat
				writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal Rp 8.000.000');
				write('> Masukkan setoran awal : Rp ');
				readln(saldo);
			until (saldo>=8000000);
			end;
		2 : begin
			R.rekening[n].mataUang := 'USD';
			repeat
				writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal USD 600');
				write('> Masukkan setoran awal : USD ');
				readln(saldo);
			until (saldo>=600);	
			end;	
		3 : begin
			R.rekening[n].mataUang := 'EUR';
			repeat
				writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal EUR 550');
				write('> Masukkan setoran awal : EUR ');
				readln(saldo);
			until (saldo>=550);	
			end;
		end;	
		i := 1;
		rekAuto := '-';
		while (i<n) and (rekAuto = '-') do
		begin
			if (R.rekening[i].nomorNasabah=R.rekening[n].nomorNasabah) and (R.rekening[i].jenisrekening = 'tabungan mandiri') then
			begin
				rekAuto := R.rekening[i].nomorAkun
			end;
			i:=i+1;
		end;
		
		writeln('> Silahkan pilih jangka waktu tabungan yang Anda inginkan');
		writeln('> 1. 1 bulan');
		writeln('> 2. 3 bulan');
		writeln('> 3. 6 bulan');
		writeln('> 4. 12 bulan');
		write('> Pilihan : ');
		readln(chs);
		while (chs<1)or(chs>4) do 
		begin
			writeln('> Masukkan angka 1-4');
			write('> Pilihan : ');
			readln(chs);
		end;
		case chs of
		1 : begin
			jw := 1;
			end;
		2 : begin
			jw := 3;
			end;
		3 : begin
			jw := 6;
			end;
		4 : begin
			jw := 12;
			end;
		end;				
		R.rekening[n].nomorAkun := '3XY0'+IntToStr(n);
		R.rekening[n].nomorNasabah := NoNasabah;
		R.rekening[n].jenisrekening := 'deposito';
		R.rekening[n].saldo := saldo;
		R.rekening[n].setoranrutin := 0;
		R.rekening[n].rekeningAutodebet := rekAuto;
		R.rekening[n].jangkaWaktu := IntToStr(jw)+' bulan';
		R.rekening[n].tanggalMulai := DateToStr(Date);
		end;
	end;
end;

procedure menu;
var
	loop : boolean;
	a : integer;
begin
	writeln('> program perbankan');
	load(lNasabah,lRekening,lSetoran,lTransfer,lPembayaran,lPembelian,lNilaiTukar);
	
	
end;
{program utama}
begin
	menu; 
end.
