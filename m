Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <36D98836.D43B972E@ruhr-uni-bochum.de>
Date: Sun, 28 Feb 1999 19:17:26 +0100
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Help/Another bootstrap test
References: <199902172309.RAA27695@equator.com> <36CB80C1.A9FEDC4A@ottawa.com> <36D8CF9C.C34C4E6B@ruhr-uni-bochum.de>
Content-Type: multipart/mixed; boundary="------------5D171D1B366D0577F4D31D0A"
Resent-Message-ID: <"sbmSW2.0.9t6.bWOss"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Dies ist eine mehrteilige Nachricht im MIME-Format.
--------------5D171D1B366D0577F4D31D0A
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Helge Deller schrieb:

> Hello all !
>
> Maybe someone with a working BOOTP or RBOOTD could please give me some help/advice,
> how to set up the network-booting for an HP 715/64 and an iA32-SuSE-6.0-Distribution
> ?
> [.....]Thanks,
> Helge Deller.
>

Ok, I got it myself work !

Here's the output:
------------------
IPL_DEBUG: Page zero parameters:
P0_IMM_max_mem:          67108864 (64MB)
P0_IMM_spa_size:         67108864
P0_MC_cont_size:         67108864
P0_MC_phys_size:         67108864
P0_MC_ad_size:           67108864
P0_BOOTCPU_mem_free:     0x000000
P0_BOOTCPU_hpa:          0xFFFBE000
P0_BOOTCPU_pdc:          0xF0012870
P0_BOOTCPU_10msec:       640000
P0_COUT_iodc_io:         0x00008480
P0_CIN_iodc_io:          0x00008000
P0_BOOTDEV_iodc_io:      0x0000BAE8
P0_COUT_class:           0x00000009
P0_CIN_class:            0x00000008
P0_BOOTDEV_class:        0x00001002
Reading parameters...donepLoading done.        <---- Original Output !
Transferri                                                          <- IT STOPPED HERE
!!!!!!!!!!

---------------------------------------------------
Booting via BOOTP on an HP 9000/715/D....

JASON: It seems, that you have to insert some wait-cycles before proceeding...!
The screen-output seems to be delayed, and so some chars seems to be overwritten (?)

Good work,
Helge Deller.

--------------5D171D1B366D0577F4D31D0A
Content-Type: text/x-vcard; charset=us-ascii; name="vcard.vcf"
Content-Description: Visitenkarte für Helge Deller
Content-Disposition: attachment; filename="vcard.vcf"
Content-Transfer-Encoding: 7bit

begin:          vcard
fn:             Helge Deller
n:              Deller;Helge
adr:            Weifeldweg 7;;;Bochum;;44795;Deutschland
email;internet: Helge.Deller@ruhr-uni-bochum.de
x-mozilla-cpt:  ;0
x-mozilla-html: TRUE
version:        2.1
end:            vcard


--------------5D171D1B366D0577F4D31D0A--

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
