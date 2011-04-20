From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Notes about the latest cache patches
Date: Wed, 20 Apr 2011 14:15:46 -0400
Message-ID: <20110420181546.GA12862@hiauly1.hia.nrc.ca>
References: <1302889310.7706.8.camel@mulgrave.site> <20110420141703.GA11761@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110420141703.GA11761@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 20 Apr 2011, John David Anglin wrote:

> Assists Check                = 0x00ed7800

> Check Summary                = 0x8400000000800000

Seems to be an assist check.  Reported something similar in 2009.
The arch talks about an architecturally defined loop for the fice
instruction (SFU?).  Maybe this is a hardware problem.

The error log contained the following:

82    SFW  0  *7  0xE880035C00E00910 00000000401011C4 ERR_CHECK_HPMC
                                                      20 Apr 2011 11:57:22
83    SFW  1  *7  0xE880035C01E00930 0000000040126638 ERR_CHECK_HPMC
						      20 Apr 2011 11:57:22
84    SFW  0   2  0x57800F7300E00950 8400000000800000 ERR_CPU_CHECK_SUMMARY
						      20 Apr 2011 11:57:22
85    SFW  1   2  0x57800F7301E00970 8400000000800000 ERR_CPU_CHECK_SUMMARY
						      20 Apr 2011 11:57:22
86    SFW  1   2  0x5680100B01E00990 0000000000000194 MC_OS_HPMC_LEN_ERR
						      20 Apr 2011 11:57:22

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
