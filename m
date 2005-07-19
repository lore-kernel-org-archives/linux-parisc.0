From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Tue, 19 Jul 2005 14:29:19 -0400 (EDT)
Message-ID: <200507191829.j6JITJl1028390@hiauly1.hia.nrc.ca>
References: <IJVYHN$354379AA3907AD5E5A7B8AAF60BAA597@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (soete.joel)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IJVYHN$354379AA3907AD5E5A7B8AAF60BAA597@scarlet.be> from
	"soete.joel" at Jul 19, 2005 01:41:47 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Dave would you mean that c3k was runing parisc-linux and a500 hpux?

Correct.

> Is there some pb in sgl -> udw convertion?

Could be.  There is a significant different between PA 1.x and 2.0
in this respect.  PA 2.0 has "hardware" instructions to do these
conversions.  GCC currently uses these instructions when generating
PA 2.0 code.

Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
