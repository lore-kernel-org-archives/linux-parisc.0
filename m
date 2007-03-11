From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc dladdr test failure
Date: Sun, 11 Mar 2007 15:53:45 -0400 (EDT)
Message-ID: <200703111953.l2BJrkPM010167__6391.51642467386$1416624325$gmane$org@hiauly1.hia.nrc.ca>
References: <20070311201750.0f280e87@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: gmsoft@gentoo.org (Guy Martin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070311201750.0f280e87@localhost> from "Guy Martin" at Mar 11,
	2007 08:17:50 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The dladdr test of the glibc testsuite fail for the following reason :
> 
> in elf/dl-addr.c:30, the address passed is transformed this way :
>   const ElfW(Addr) addr = DL_LOOKUP_ADDRESS (address);
> 
> 
> While in ports/sysdeps/hppa/dl-lookupcfg.h:35, you have this :
> 
> /* Clear the bottom two bits so generic code can find the fdesc entry */
> #define DL_LOOKUP_ADDRESS(addr) \
>   (_dl_lookup_address ((void *)((unsigned long)addr & ~3)))
> 
> 
> If you don't apply this bitmask, addr is set to the original value of
> the passed address and it is resolved correctly.
> 
> What should be the correct fix ?

I don't believe you have provided enough info regrading the cause
of the failure.  The PA port uses the bottom two bits for special
purposes.  Magic is used to compare function pointers.

Be very careful with this.  Changing the treatment of the bottom
two bits in function pointers will break calls to/from functions
in any shared library (i.e., any call that uses a fdesc).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
