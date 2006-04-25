From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Tue, 25 Apr 2006 16:09:34 -0400
Message-ID: <119aab440604251309i4186ac6cp25b40f7b2c9f7549@mail.gmail.com>
References: <IY9MLX$78E3F79033FFF0B479BDF074F042B181@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IY9MLX$78E3F79033FFF0B479BDF074F042B181@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Carlos,
>
> Ok for me to focus on float pb: I just started some month ago and iirc
> numerous pb are around nan (Not-a-Number) values. TBH, before reading tha=
t I
> was ignoring all about this (eventhought I was good in numerical computin=
g at
> school, well 20 years ago, but not yet enough ;-) ). So I need first to
> isolate faulty stuff then attempt to analyse the pb...

Perhaps ask Dave if he has some libstdc++ failures for you to look into?
There are all sorts of interesting areas you can learn if you are intereste=
d.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
