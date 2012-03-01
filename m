From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC (take 2)
Date: Wed, 29 Feb 2012 19:48:30 -0500
Message-ID: <BLU0-SMTP24BED21C1D225648257137976C0@phx.gbl>
References: <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl> <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl> <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com> <4F031B1A.4010908@bell.net> <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com> <4F032C4C.10805@bell.net> <1325608972.3185.8.camel@dabdike.int.hansenpartnership.com> <4F034B6B.5020809@bell.net> <BLU0-SMTP5091B64E5E2C07CEDC0D41978C0@phx.gbl> <4F4CF28A.5050407@bell.net> <20120228225605.GA24038@glitch>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Domenico Andreoli <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120228225605.GA24038@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 28-Feb-12, at 5:56 PM, Domenico Andreoli wrote:

> I applied this patch to v3.3-rc5 and then tried to build eglibc  
> 2.13-27,
> unsuccessfully. Do you have any patch for it?


I should have remembered.  You have to remove/move the expected  
results file
(expected-results-hppa-linux-gnu-libc) out of the way -- it hasn't  
been updated.
Otherwise, the build will fail in the testsuite.

Dave
--
John David Anglin	dave.anglin@bell.net



