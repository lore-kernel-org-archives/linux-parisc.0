Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52801482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 09:33:43 -0700 (MST)
Message-Id: <200211211605.gALG5IFM000465@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc + SuSE (When email becomes to much)
To: jsoe0708@tiscali.be
Date: Thu, 21 Nov 2002 11:05:17 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3DA3C54C000066FE@ocpmta5.be.tiscali.com> from "jsoe0708@tiscali.be" at Nov 21, 2002 08:39:43 am
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

> -DL_divI -xassembler-with-cpp -c /Develop/parisc-linux/src/gcc/gcc/config/pa/milli64.S
> -o libgcc/./_divI.o
> /Develop/parisc-linux/build/gcc/gcc/collect2: /lib/libc.so.6: version `GLIBC_2.3'
> not found (required by /Develop/parisc-linux/build/gcc/gcc/collect2)
> make[2]: *** [libgcc/./_divI.oS] Error 1
> make[2]: Leaving directory `/Develop/parisc-linux/build/gcc/gcc'
> make[1]: *** [libgcc.a] Error 2
> make[1]: Leaving directory `/Develop/parisc-linux/build/gcc/gcc'
> make: *** [all-gcc] Error 2
> 
> ### Wed Nov 20 18:54:33 2002 ###
> 
> So it seems that it did not get the right path to the libc.so?

Set LD_LIBRARY_PATH to include the directory where your new libc is.
You may also want to set the GCC LIBRARY_PATH environment variable.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
