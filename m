Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA21588
	for <parisc-linux@puffin.external.hp.com>; Mon, 23 Oct 2000 02:30:52 -0600
Received: from ms04.mobilix.dk (ms04.mobilix.dk [172.16.1.24])
	by orbix.mobilix.dk (8.11.0/8.11.0) with SMTP id e9N5VPq05455
	for <parisc-linux@thepuffingroup.com>; Mon, 23 Oct 2000 07:31:25 +0200
Message-ID: <818F6C8F771DD211B5EA0008C7FABF4B02BB1A95@ms08.mobilix.dk>
From: "Servio E. Cabrera" <servio.cabrera@mobilix.dk>
To: "Parisc-Linux mailing list \(E-mail\)" <parisc-linux@thepuffingroup.com>
Date: Mon, 23 Oct 2000 10:34:16 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] CD image does not recognize the SCSI Hard Drives! on C110
List-ID: <linux-parisc.vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----


Hello:

I have booted the CD image on several machines and does not recognize
the SCSI HarD drive, the machine I have a HP9000 s700 / c110.
I perform a "fdisk /dev/sda" and it says "unable to open /dev/sda" I
have also done this:
#for q in /dev/sd* /dev/hd*
do
fdisk $q
done

I got unable to open .... for the all those device files

REgards


servio

- -

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQEVAwUBOfP3o1I12LBR8vnZAQHneQf/ZRnoIlh0oqI6xAO8zvo1VIf8ylMKEdTa
wTc47iiDYsZANAJnniBcJkuxJNkU8/LEURYtxNBICJU0FkrVZ5Pqf0XMi7sqh/uQ
5TkJKHkpIOur32UUEMUaVKSsCcg85KV5AFMiW34sHvnKPGXYBvCu67U7rFreL/0I
8Pgln09Y7vxchWccNSGp2vh8vVFrAfYXC8ah0gMBixFUufNpGFv6G+kl9z9rsNuM
9Bu3SIIY97ptVMpe4uD8bwhBGMFT2j5MWs4OR410RQxIVZhRLZSj9oZevdYgT7gw
ppy3lH+8RrzmdS0/pZpjbIStRYjDmeDSHV8T1NmPlyqzhsXQaLIXvQ==
=BPIF
-----END PGP SIGNATURE-----
