From: John David Anglin <dave.anglin@bell.net>
Subject: Re: 4.12-rc5+: segfault while compiling, on rp3410
Date: Tue, 20 Jun 2017 12:11:51 -0400
Message-ID: <d2f4c409-16db-7dbb-533f-c7e56515bceb@bell.net>
References: <alpine.LRH.2.20.1706201714280.12869@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1706201714280.12869@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-06-20 10:20 AM, Meelis Roos wrote:
> I am using gentoo on my hppa machines and just tried
> 4.12.0-rc5-00187-gab2789b at the end of last week. This time there
> was new gcc release so a lot of work. rp3440 and A500 had no problems,
> rp3410 errored out with SIGSEGV, twice.
Helge and I have had a long discussion about these SEGVs.  They are 
essentially random.
The are very rare on UP machines.  I don't think we have seen one yet on 
the panama buildd
machine which is also a rp3410.  They are much more common on phantom 
which is four way
c8000 at 1 GHz.

Dave

-- 
John David Anglin  dave.anglin@bell.net

