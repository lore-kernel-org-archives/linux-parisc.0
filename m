From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: hppa64-...-gcc-4.1 annoying pb?
Date: Fri, 5 May 2006 09:46:34 -0400 (EDT)
Message-ID: <200605051346.k45DkZ9R019019@hiauly1.hia.nrc.ca>
References: <IYS8WE$1149DA86EF81D47F85EBAF2CD08B40A2@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IYS8WE$1149DA86EF81D47F85EBAF2CD08B40A2@scarlet.be> from "Joel
	Soete" at May 5, 2006 10:00:14 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> mmm, this seems to be a key;
> this morming (to me), I rebuild 2.6.17-rc3-pa3 + your patch the 64bit kernel on:
>     1/ the n4k + ulimit -v 524288 -> compile time nornal 
> 
>     2/ the b2k (default ulimit -v being ulimited) ->  page_alloc.c compilation 
>        very long (even thought this only have 256Mb?)
> 
> > This is on a machine with 1 GB.  I had found that the VM system
> > could thrash and the system crash when it tried to allocate about
> > 1 GB.

I think this is a UP problem.  When too much VM gets allocated
to one process, it blocks some userspace kernel support.  The
following assembler file was where I first noticed the problem:

	.data
foo:
	.block -1

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
