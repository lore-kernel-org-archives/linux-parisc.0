From: Roel Kluin <roel.kluin@gmail.com>
Subject: Re: [PATCH] parisc: test off by one in sgl_frem() and dbl_frem()
Date: Sun, 27 Dec 2009 22:11:06 +0100
Message-ID: <4B37CD6A.2000506@gmail.com>
References: <4B375F68.80301@gmail.com> <1261927804.2697.4.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1261927804.2697.4.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Op 27-12-09 16:30, James Bottomley schreef:
> On Sun, 2009-12-27 at 14:21 +0100, Roel Kluin wrote:
>> With `while (stepcount-- > 0)' stepcount reaches -1 after the loop.
> 
> This is true, but seems to be by design

>> -	if (stepcount > 0 || Sgl_iszero(opnd1)) {
>> +	if (stepcount >= 0 || Sgl_iszero(opnd1)) {

> 
> Your patch does nothing to the actual execution flow (Sgl_iszero is true
> if stepcount == 0) ... what's the point of applying it?
> 
> James

Ok, please ignore and thanks (also to Dave) for review.

Roel
