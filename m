Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47D954846
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 08:58:14 -0700 (MST)
Message-Id: <200202191558.g1JFw9Zc016411@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
To: jso@europay.com (=?iso-8859-1?Q?Jo=EBl_Soete?=)
Date: Tue, 19 Feb 2002 10:58:09 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, jso@europay.com, "jso"@hiauly1.hia.nrc.ca,
	<jso@europay.com>, parisc-linux@lists.parisc-linux.org,
	"jso"@hiauly1.hia.nrc.ca
In-Reply-To: <OF6C877807.5EEE6DAF-ONC1256B65.0050B12E@com> from "=?iso-8859-1?Q?Jo=EBl_Soete?=" at Feb 19, 2002 03:43:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
