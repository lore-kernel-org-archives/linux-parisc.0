From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: I have 12GB of RAM but I can only use 1GB?
Date: Tue, 18 Sep 2012 21:36:20 -0400
Message-ID: <CAE2sS1i5E9FDB_5aw+mTySEysOjuLjOQn7S_pOL5-EMBOudqPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Jej B <James.Bottomley@hansenpartnership.com>
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Team,

I recently setup my rp3440 in order to get back into more active
development for hppa.

I noticed that in 3.6.0-rc6 I get the following message:
~~~
This Machine has more memory ranges than we support!
Some memory will not be used!
parisc_cache_init: Only equivalent aliasing supported!
Total Memory: 1024 MB
~~~

Which sucks since I have 12GB of RAM in this box and I want to use all of it.

If nobody has run into this problem then I'll just go digging, but I
thought I'd ask here first.

Cheers,
Carlos.
