From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Notes about the latest cache patches
Date: Fri, 15 Apr 2011 12:41:50 -0500
Message-ID: <1302889310.7706.8.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The one that seems to make the most difference to me is not having the
kernel memory cache pages be marked executable.  This cures an
intermittent segfault I was seeing with git on the pa8800.

Also note that if you apply only the speculative read prevention patch,
you'll find the incidences of segfaults and cache nasties get worse (at
least they do on ion) mainly because the aggressive TLB purging leaves
the cache hardware with fewer lines to speculate, so it tends to be more
aggressive about speculating them ... leading to more incidences.

I find that the combination of the two patches cures all the segfaults
I've been seeing in normal compiles and git operations.

James


