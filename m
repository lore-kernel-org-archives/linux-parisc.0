From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Sun, 9 Jan 2011 16:27:54 -0500
Message-ID: <20110109212754.GA29160@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20101229042346.GA973@hiauly1.hia.nrc.ca> <1293634281.2803.4.camel@fuzzy> <20101230155640.GA7058@hiauly1.hia.nrc.ca> <20101230160944.GA7360@hiauly1.hia.nrc.ca> <20110101183108.GA19035@hiauly1.hia.nrc.ca> <20110105034922.GA4120@hiauly1.hia.nrc.ca> <AANLkTikC_1OGzzUkFpiCGx+F=29E9BZnyzU8xL0V-JU0@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTikC_1OGzzUkFpiCGx+F=29E9BZnyzU8xL0V-JU0@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I filed a binutils bug report for this problem:
http://sourceware.org/bugzilla/show_bug.cgi?id=12376

However, I now think the problem can't be fixed reliably by a change
to binutils.  See comments #2 and #3 in the bug report.

James, would using different file descriptors for the mmap'd PT_LOAD
segments in an executable result in different pages being used for
"code" and "data" in the overlap region of the executable file, and
thereby avoid the inequivalent aliases?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
