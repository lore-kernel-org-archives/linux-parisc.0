From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Question on video cards.
Date: Wed, 31 May 2006 13:06:15 +0200
Message-ID: <7d01f9f00605310406v2df7f5e3qd87e79ec108c5779@mail.gmail.com>
References: <1149048178_22889@mail.internode.on.net>
	<e6eae0290605310116m3fe25a88o675e7e95cd1a8e70@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Max Grabert" <parisc@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae0290605310116m3fe25a88o675e7e95cd1a8e70@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/31/06, Max Grabert <parisc@gmail.com> wrote:
> On 31/05/06, pyrotek <pyrotek@internode.on.net> wrote:

> > If so can I piggy back it off my FX10? Or do I need to use it by it self?
>
>
> You should be able to do both. Use sticon/stifb/X11 (fbdev) with the FX10

Err... No.

Only sticon works on FX cards. That's the whole point, you cannot do
graphics *at all* with them. Only text.

HTH

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
