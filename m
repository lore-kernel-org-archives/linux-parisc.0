From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Gcc bug or I missunderstand? [ftsd %fr22,
Date: Wed, 15 Dec 2004 14:01:26 -0500 (EST)
Message-ID: <200412151901.iBFJ1Q7v004439@hiauly1.hia.nrc.ca>
References: <20041215171813.GA28058@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041215171813.GA28058@parcelfarce.linux.theplanet.co.uk> from
	"Matthew Wilcox" at Dec 15, 2004 12:18:13 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Quick look at page 9-24 of the Kane book indicates that for d between +15
> and -16 we use format 42 and for d outside that range, we use format 3.
> Looks like nobody bothered to teach binutils about this longer form yet.

Yes, I hit this a couple of years ago in GCC.  Binutils needs to be
taught some new relocations to support the long fp displacements.

> Is it possible it's only available for PA2.0 processors?

This is only available in PA 2.0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
