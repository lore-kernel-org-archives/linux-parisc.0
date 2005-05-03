From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Tue, 3 May 2005 17:58:03 +0000
Message-ID: <426F252F00002E4D@mail-1-bnl.tiscali.it>
References: <200505031334.j43DYRBT004104@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505031334.j43DYRBT004104@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> > > The problem code is in fs/select.c:
> > > 
> > >                 for (j=3D0; j < walk->len; j++, ufds++) {
> > > 			if(__put_user(fds[j].revents, &ufds->revents))
> > > 				goto out_fds;
> > > 		}
> > > 
> > > The sth is in the __put_user code.
> > > 
> > Ah I see, just need to recover your lastest patch as basic work (I tr=
usted
> > that I laready tested it here at the office, but no trace: may be on
the
> > system n4k down for now :-( )
> 
> No, I don't believe it will fix the problem as it doesn't affect
> the transfer of shorts.
> 
> It's not clear why the insn is causing a protection fault.  A bad
> pointer could of been passed to the kernel, or the kernel has done
> something bad.
> 
Thanks.

Btw, I reach to install gcc-4.0-pre9 experimental pre-build dpkg and comp=
ile
kernel ;-)
unfortunately:
# grep canon vmlinux-gcc4.dmp
10111a68 <__canonicalize_funcptr_for_compare>:
101271d4:       eb f5 b1 19     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101271e4:       eb f5 b0 f9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10127230:       eb f5 b0 61     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10127240:       eb f5 b0 41     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10128c7c:       eb f4 bb c9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10128c88:       eb f4 bb b1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1013380c:       eb ef a4 a9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10133818:       eb ef a4 91     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101347e8:       eb ee a4 f5     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101347f4:       eb ee a4 dd     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101349bc:       eb ee a1 4d     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101349c8:       eb ee a1 35     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1013580c:       eb ee a4 a9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10135818:       eb ee a4 91     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10135afc:       eb ed be cd     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10135b08:       eb ed be b5     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10135c20:       eb ed bc 85     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10135c2c:       eb ed bc 6d     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10136ea4:       eb ed b7 79     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10136eb0:       eb ed b7 61     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101374bc:       eb ed ab 49     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101374c8:       eb ed ab 31     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101374e8:       eb ed aa f1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101374f4:       eb ed aa d9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1013e5d0:       eb e9 a9 25     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1013e5dc:       eb e9 a9 0d     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1013e7ac:       eb e9 a5 6d     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1013e7b8:       eb e9 a5 55     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10169554:       eb d4 aa 19     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10169564:       eb d4 a9 f9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101a2584:       eb b7 a9 bd     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
101a2590:       eb b7 a9 a5     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1020ad2c:       eb 83 ba 69     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1020ad3c:       eb 83 ba 49     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102217cc:       eb 78 a5 29     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102217dc:       eb 78 a5 09     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1022183c:       eb 78 a4 49     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1022184c:       eb 78 a4 29     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10230c28:       eb 70 bc 71     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10230c34:       eb 70 bc 59     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1023199c:       eb 70 a1 89     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102319a8:       eb 70 a1 71     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102319d0:       eb 70 a1 21     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102319dc:       eb 70 a1 09     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10232858:       eb 6f a4 15     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10232868:       eb 6f a3 f5     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10234e10:       eb 6e b8 a1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10234e1c:       eb 6e b8 89     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10235354:       eb 6e ae 19     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10235364:       eb 6e ad f9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10236958:       eb 6d a2 15     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10236968:       eb 6d a1 f5     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10255900:       eb 5e a2 c1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10255910:       eb 5e a2 a1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10255960:       eb 5e a2 01     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10255970:       eb 5e a1 e1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10267860:       eb 55 a4 01     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10267870:       eb 55 a3 e1     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1028e64c:       eb 41 a8 2d     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1028e65c:       eb 41 a8 0d     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10294760:       eb 3e a6 05     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10294770:       eb 3e a5 e5     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1029718c:       eb 3d b1 a9     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
1029719c:       eb 3d b1 89     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102c53c4:       eb 26 ad 39     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102c53d0:       eb 26 ad 21     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102ed42c:       eb 12 ac 69     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102ed438:       eb 12 ac 51     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102f3ab8:       eb 0e bf 55     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
102f3ac8:       eb 0e bf 35     b,l 10111a68 <__canonicalize_funcptr_for_=
compare>,%r2
10380978 <__ksymtab___canonicalize_funcptr_for_compare>:
1038542c <__kstrtab___canonicalize_funcptr_for_compare>:

this one doesn't seems to help me to get rid of those call __canonicalize=
_funcptr_for_compare().

Do you think that gcc-4.0 final release will help more?

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
