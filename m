From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Tue, 25 Apr 2006 08:41:57 +0200
Message-ID: <IY9MLX$78E3F79033FFF0B479BDF074F042B181@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Dave, Carlos,
> > btw: just as game, I rebuild glibc-2.3.6 + my clone patch with gcc-4.=
1 and
> > with same src and same kernel (results vary a very few with kernel re=
lease?),
> 
> Have you tried rebuilding GCC with your new library?
Not yet...
>  I'm interested
> in knowing how the fortran and libstdc++ testresults turn out.
>
Ok just grab svn 20060425 (svn 113240) and start its build on my b2k, nev=
er
the less will take some time, I will advise asap ;-)
 
Carlos,

Ok for me to focus on float pb: I just started some month ago and iirc
numerous pb are around nan (Not-a-Number) values. TBH, before reading tha=
t I
was ignoring all about this (eventhought I was good in numerical computin=
g at
school, well 20 years ago, but not yet enough ;-) ). So I need first to
isolate faulty stuff then attempt to analyse the pb...

Hth,
    Joel
=0A=0A----------=0AWordt ook lid van de Scarlet Club via een bestaande Sc=
arlet klant en ontvang cadeaucheques twv EUR 50! Bezoek snel http://www.s=
carletclub.be=0ADevenez aussi membre du Club Scarlet via un client Scarle=
t existant et recevez des cheques cadeaux jusqu'a EUR 50! Surfez vite sur=
 http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
