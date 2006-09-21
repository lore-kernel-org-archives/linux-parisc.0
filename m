From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] Re:w-a to what [Was: D380 and ext[23] fs grave pb]
Date: Thu, 21 Sep 2006 09:44:18 +0200
Message-ID: <J5XMTU$E343E6866EECDA1EF5A8398F48EC38DA@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "James.Bottomley" <James.Bottomley@SteelEye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 matthew <matthew@wil.cx>
To: "soete.joel" <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hello James, Matthrew,
> 
Just small update ;-)

> I come back to you with this pb because as explained in a previous mail=
: 
>
<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/0301=
52.html>
> 
> , it seems to be related to ncr53c720 driver.
> 
> As I encountered same kind of pb on my c110:
> a few time after the reboot, I just did a tar/untar and already get:
> EXT3-fs error (device md2): ext3_readdir: bad entry in directory4Remoun=
ting
filesystem read-only
> 
> That said, it seems that I find a work around: I just reverted this
>
<http://cvs.parisc-linux.org/linux-2.6/drivers/scsi/ncr53c8xx.c?r1=3D1.18=
&r2=3D1.19&makepatch=3D1&diff_format=3Dh>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /var/lib/cvs/linux-2.6/drivers/scsi/ncr53c8xx.c,v
> retrieving revision 1.18
> retrieving revision 1.19
> diff -u -r1.18 -r1.19
> --- linux-2.6/drivers/scsi/ncr53c8xx.c	2004/07/20 22:06:43	1.18
> +++ linux-2.6/drivers/scsi/ncr53c8xx.c	2004/07/27 21:19:51	1.19
> @@ -8633,7 +8633,7 @@
>    	tpnt->this_id		=3D 7;
>    	tpnt->sg_tablesize	=3D SCSI_NCR_SG_TABLESIZE;
>    	tpnt->cmd_per_lun	=3D SCSI_NCR_CMD_PER_LUN;
> -	tpnt->use_clustering	=3D DISABLE_CLUSTERING;
> +	tpnt->use_clustering	=3D ENABLE_CLUSTERING;
> 
>    	if (device->differential)
>    		driver_setup.diff_support =3D device->differential;
> =3D=3D=3D <> =3D=3D=3D
> 
> And a loop like:
> # while true; do nice -n -5 tar -xslpf linux-2.6.12-rc1-pa1.tar ; nice =
-n -5
rm -rf linux-2.6.12-rc1-pa 1-050319; date; done
> 
> was already running at least 85 time without any pb on this same c110 (=
same
kernel 2.6.18-rc6-pa1 + jejb's patch + your
> timer_interrupt patch).
> 
A longuer test on d380 (2.6.18-rc7-pa1 32bit up kernel) failed after only=
 some
loop with message:
EXT3-fs error (device sda10): ext3_readdir: bad entry in directory #14607=
0:
rec_len % 4 !=3D 0 - offset=3D0, inode=3D17645
Aborting journal on device sda10.                                        =
    
                                                      
ext3_abort called.                                                       =
    
                                                      
EXT3-fs error (device sda10): ext3_journal_start_sb: Detected aborted jou=
rnal
                                                      
Remounting filesystem read-only

Too bad ;-(

Thanks,
    Joel

=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
