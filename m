Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 8 Feb 2003 20:27:05 -0700
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030209032705.GE19683@dsl2.external.hp.com>
References: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sat, Feb 08, 2003 at 07:35:18PM -0500, John David Anglin wrote:
> > +#define spin_unlock(x) \
> > +		__asm__ __volatile__ ("stw,o  %%sp,0(%0)" : : "r" (x) : "memory" )
> 
> If you change the above to
> 
>   __asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (x) : "memory")
> 
> it should work on both PA11 and PA20.  The ordered completer is only
> PA 2.

Excellent idea.

In case it's not obvious to others, "stw,o" is an alias
for "stw,ma" with a Zero index value. But PA11 assembler
will grok the stw,ma properly.

I'll look at getting this into the kernel this week if someone
else doesn't beat me to it.  I'd like to test what I've got a bit
more now and get the binutils .deb availability issue resolved.

thanks,
grant
