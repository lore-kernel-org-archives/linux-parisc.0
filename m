From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Mon, 15 Aug 2005 23:32:48 -0400 (EDT)
Message-ID: <200508160332.j7G3WnGx022020@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Aug 15, 2005 11:18:00 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > static void sighandler(int sig)
> > {
> >         printf("Got signal %d\n", sig);
> >         exit(0);
> 
> I think you need to use _exit in a signal handler although this may
> not be an issue when there is only one thread.

GCC uses exit.  Either way, the kernel shouldn't hang.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
