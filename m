From: NIIBE Yutaka <gniibe@fsij.org>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Thu, 01 Apr 2010 10:57:56 +0900
Message-ID: <4BB3FDA4.4070706@fsij.org>
References: <4BB0B2C8.8000302@fsij.org>	 <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com>	 <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>	 <20100329200705.GE20286@bombadil.infradead.org> <119aab441003301338o1d0582f3wdbf82681f88ed671@mail.gmail.com> <4BB3F40A.7020401@fsij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BB3F40A.7020401@fsij.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

NIIBE Yutaka wrote:
> Today, I have a next question.  Is there any cache alias problem here?
> Should we invalidate the cache line before "load" and flush the cache
> line after "store"?

Sorry, I was confused.  We are talking threads which shares memory
context (space identifier), so, my concern is not relevant.
-- 
