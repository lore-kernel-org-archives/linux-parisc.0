From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] waitid doesn't work on hppa?
Date: Fri, 24 Sep 2004 09:32:35 -0700
Message-ID: <20040924163235.GA22642@tausq.org>
References: <20040924035552.GS27033@baldric.uwo.ca>
	<200409240416.i8O4GKQp026533@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409240416.i8O4GKQp026533@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from John David Anglin, dated Sep 24:
> > I see waitid regressions in the glibc testsuite. I'm not sure if this
> > had anything to do with these hanging processes. I haven't looked too
> > deeply.
> 
> This is probably the cause of the expect hangs.  For some reason
> tcl8.3 works better than 8.4.

i don't think expect/tcl uses waitid (not waitpid....)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
