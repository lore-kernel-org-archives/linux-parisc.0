From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Tue, 25 Apr 2006 16:20:19 -0400 (EDT)
Message-ID: <200604252020.k3PKKJe8008879@hiauly1.hia.nrc.ca>
References: <119aab440604251309i4186ac6cp25b40f7b2c9f7549@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: soete.joel@tiscali.be,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440604251309i4186ac6cp25b40f7b2c9f7549@mail.gmail.com>
	from "Carlos O'Donell" at Apr 25, 2006 04:09:34 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Ok for me to focus on float pb: I just started some month ago and iirc
> > numerous pb are around nan (Not-a-Number) values. TBH, before reading that I
> > was ignoring all about this (eventhought I was good in numerical computing at
> > school, well 20 years ago, but not yet enough ;-) ). So I need first to
> > isolate faulty stuff then attempt to analyse the pb...
> 
> Perhaps ask Dave if he has some libstdc++ failures for you to look into?
> There are all sorts of interesting areas you can learn if you are interested.

libstdc++ is pretty much ok (1 FAIL on head at the moment).  The easiest
way to find problems that need work is to go to the bugzilla search page:
http://gcc.gnu.org/bugzilla/query.cgi

Do a search with "hppa" in the target box.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
