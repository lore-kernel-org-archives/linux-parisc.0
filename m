From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] X startup failure
Date: Thu, 29 Dec 2005 12:59:05 -0500 (EST)
Message-ID: <200512291759.jBTHx5Qe003164@hiauly1.hia.nrc.ca>
References: <200512291541.jBTFfNbf002585@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512291541.jBTFfNbf002585@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Dec 29, 2005 10:41:23 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > >>On Monday 26 December 2005 22:34, John David Anglin wrote:
> > >>
> > >>>X no longer starts on my c3k using unstable.  The problem seems
> > >>>to be:

Problem solved.  Somehow kde (kdm) had been purged and there was no
longer a window manger installed.  I'm sure I didn't manually delete
it.

I tried to reinstall kde but it currently can't be installed using
apt-get due to unmet dependencies.  Possibly, this has something to do
with how it got purged.

I installed gnome and X now starts.

Thanks for all the help,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
