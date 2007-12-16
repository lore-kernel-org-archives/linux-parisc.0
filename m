From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Sun, 16 Dec 2007 13:32:15 -0500
Message-ID: <20071216183215.GB8558@fattire.cabal.ca>
References: <20071206201928.GA8778@hera.kernel.org> <200712161829.lBGITcOV013611@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@hera.kernel.org>, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200712161829.lBGITcOV013611@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 16, 2007 at 01:29:38PM -0500, John David Anglin wrote:
> I built a SMP PA8800 configuration from this respository yesterday.
> Aside from the timeout issue that I've mentioned before, I've experienced
> erratic login behavior with this new kernel.  I see this in the debug log:
> 

is this using debian sid? or testing? possibly during the update to
glibc 2.7 a regression crept in?

cheers,
	kyle
