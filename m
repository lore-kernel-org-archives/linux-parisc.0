From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Mon, 15 Aug 2005 23:18:00 -0400 (EDT)
Message-ID: <200508160318.j7G3I17Q021898@hiauly1.hia.nrc.ca>
References: <43015757.2080207@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43015757.2080207@tausq.org> from "Randolph Chung" at Aug 16,
	2005 11:02:47 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> static void sighandler(int sig)
> {
>         printf("Got signal %d\n", sig);
>         exit(0);

I think you need to use _exit in a signal handler although this may
not be an issue when there is only one thread.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
