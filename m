From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 14:42:03 -0400 (EDT)
Message-ID: <20080909184204.B3F9B4E2A@hiauly1.hia.nrc.ca>
References: <1220983921.3334.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: waldi@debian.org, dannf@dannf.org, debian-kernel@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220983921.3334.36.camel@localhost.localdomain> from "James Bottomley" at Sep 9, 2008 01:12:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Um, because the architecture doesn't have an i2c bus.

Don't know about rtc but some PA-RISC models definitely have an i2c bus.
I see this message on a A500-75 model:

     The support bus which connects the system processors, the Guardian Service
     Processor (GSP) and the Power Monitor or Platform Monitor may have become
     hung.  (The support bus can be tested by issuing the GSP command "XD", and
     selecting the I2C access test).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
