From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Wed, 10 Mar 2010 22:20:49 -0500
Message-ID: <20100311032049.GA14312@hiauly1.hia.nrc.ca>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca> <20100307203230.CAC964E77@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: deller@gmx.de, carlos@systemhalted.org, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100307203230.CAC964E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 07 Mar 2010, John David Anglin wrote:

> I have the feeling that Helge's patch helps (possible resolves) the
> minifail bug.

With further testing, I find that the patch doesn't resolve the minifail
fails on my c3750.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
