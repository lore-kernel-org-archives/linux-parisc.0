From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Little endianness
Date: Tue, 10 Feb 2015 10:30:34 -0500
Message-ID: <BLU436-SMTP173A5545802614E9A03A58A97240@phx.gbl>
References: <loom.20150210T112204-76@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
To: Held Bier <lausgans@gmail.com>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <loom.20150210T112204-76@post.gmane.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-02-10 5:31 AM, Held Bier wrote:
> Hi.
>
> Looks like PA-RISC 1.1 added bi-endian support.
> What about PA-RISC Linux? I know it's big endian.
> But does it possible to build little endian kernel? If so, how?
> Is migration to little endian planned? It should be reasonable
> as it will bring more  compatibility with other Linux world.
Unlikely.  According to the PA 2.0 arch, implementation of this feature 
was optional.

Further the PDC/IODC firmware and software tool chains need little 
endian support.  This
is a massive amount of work.  So, unless one one decided to create a 
64-bit embedded
PA-RISC processor for mass deployment, it wouldn't be worth the effort.

Dave

-- 
John David Anglin  dave.anglin@bell.net

