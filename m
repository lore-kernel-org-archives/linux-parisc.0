Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC6C14841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 09:57:24 -0700 (MST)
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, jso@europay.com,
	"jso" <jso@europay.com>(=?iso-8859-1?Q?Jo=EBl_Soete?=),
	parisc-linux@lists.parisc-linux.org, "jso"@hiauly1.hia.nrc.ca
Message-ID: <OFDF1A47D3.4AEE03AD-ONC1256B65.005CFBD9@com>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Tue, 19 Feb 2002 18:03:22 +0100
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

David,

It seems Ok: just finished the first step of compiling gcc (snapshot  dated
020218 from sources.redhat.com because I do not find where Matthias
uploaded its snapshot :( ) with echo $? -> after make :-).
I will continue with glibc.

Thanks for all,
     Joel

PS: with gcc snapshot, I also find gcc-core-xxx.bz2. Do know what is it?
(Do I need it?)



                                                                           =
                                         =20
                    "John David                                            =
                                         =20
                    Anglin"                To:     jso@europay.com (Jo=EBl =
Soete)                                     =20
                    <dave@hiauly1.h        cc:     carlos@baldric.uwo.ca, j=
so@europay.com, "jso"@hiauly1.hia.nrc.ca,=20
                    ia.nrc.ca>             <jso@europay.com>, parisc-linux@=
lists.parisc-linux.org, "jso"            =20
                                           @hiauly1.hia.nrc.ca             =
                                         =20
                    19-02-02 04:58         Subject:     Re: [parisc-linux] =
Re: hppa-linux gcc-3.0.3:                =20
                    PM                                                     =
                                         =20
                                                                           =
                                         =20
                                                                           =
                                         =20




> Just finished to compile binutils. All seems Ok.
> I just notice many "WARNING: could not find 'runtest'" when "make -k
> check". Is it normal?

This is normal:

if /bin/sh -c "$runtest --version" > /dev/null 2>&1; then \
  $runtest --tool libstdc++-v3 --srcdir $srcdir ; \
else echo "WARNING: could not find \`runtest'" 1>&2; :;\
fi
WARNING: Couldn't find the global config file.
WARNING: Couldn't find tool init file

You can get rid of the "global config" warning by installing a global
config file for dejagnu.  There is as sample in the distribution.

If you actually see your warning and not just the Makefile command,
then you have a problem with your dejagnu installation or PATH variable.
In order to run the testsuite, you need dejagnu, expect and tcl
installed.  They may require some other packages as well for full
functionality.

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
