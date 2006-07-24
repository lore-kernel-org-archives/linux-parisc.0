From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Mon, 24 Jul 2006 10:58:24 -0400 (EDT)
Message-ID: <200607241458.k6OEwOif027105@hiauly1.hia.nrc.ca>
References: <20060724033223.GE29603@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org,
 T-Bone@parisc-linux.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060724033223.GE29603@parisc-linux.org> from "Matthew Wilcox"
	at Jul 23, 2006 09:32:23 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sun, Jul 23, 2006 at 10:54:38PM -0400, Thibaut VARENE wrote:
> > My take is that we see that bug so much more on pa8800 because of its
> > huge cache and thus because we hit cache much more often than on all
> > other machines...
> 
> I don't think so.  pa8800 has less cache per core than pa8700.  The L2
> cache is ignorable for the purposes of this scenario, since it's
> transparent to software.

It is visible.  You see it in the size returned for the D cache by
PDC_CACHE.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
