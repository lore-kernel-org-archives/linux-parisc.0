Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1A82483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 07:37:48 -0700 (MST)
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, jso@europay.com,
	"jso" <jso@europay.com>(=?iso-8859-1?Q?Jo=EBl_Soete?=),
	parisc-linux@lists.parisc-linux.org, "jso"@hiauly1.hia.nrc.ca
Message-ID: <OF6C877807.5EEE6DAF-ONC1256B65.0050B12E@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Tue, 19 Feb 2002 15:43:39 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello David,

Just finished to compile binutils. All seems Ok.
I just notice many "WARNING: could not find 'runtest'" when "make -k
check". Is it normal?

Thanks,
     Joel



                                                                           =
                                         =20
                    "John David                                            =
                                         =20
                    Anglin"                To:     jso@europay.com (Jo=EBl =
Soete)                                     =20
                    <dave@hiauly1.h        cc:     carlos@baldric.uwo.ca, "=
jso"@hiauly1.hia.nrc.ca,                 =20
                    ia.nrc.ca>             <jso@europay.com>, parisc-linux@=
lists.parisc-linux.org                   =20
                                           Subject:     Re: [parisc-linux] =
Re: hppa-linux gcc-3.0.3:                =20
                    18-02-02 07:03                                         =
                                         =20
                    PM                                                     =
                                         =20
                                                                           =
                                         =20
                                                                           =
                                         =20




> PS: I would try natively (on my palinux box directly) with
MACH=3Dhppa-linux
> i.e.: ~/source/binutils/configure --host=3Dhppa-linux ... ?

For binutils, I just use from my build directory:

../src/configure --prefix=3D/where_to_install --host=3Dhppa-linux --disable=
-nls
make
make -k check
make install

Set CFLAGS if you want.

Dave
--
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX:
952-6605)






**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
