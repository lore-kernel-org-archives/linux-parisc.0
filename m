From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Fw:Some questions about your clone.S patch for glibc
	hppa port:
Date: Wed, 24 May 2006 21:09:03 +0200
Message-ID: <IZSAJ3$02AA95A81D5AA8D700871676713F4C99@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

Hello Carlos,

Sorry, I did have any more cvs access (here at the office) to grab latest=
 cvs
stuff (to be able to present you a patch idea) but I have few questions:

    1/ could we (/you/I), use some macro of hppa/sysdep.h.diff like:
        SAVE_PIC(SREG), LOAD_PIC(LREG) that would look like:
[snip]
-       /* Save the PIC register. */
-#ifdef PIC
-       stw     %r19,-32(%sr0, %sp)     /* parent */
-#endif
+       SAVE_PIC (TREG)
[snip]
-       /* Restore the PIC register on error */
-#ifdef PIC
-       ldw     -32(%sr0, %sp), %r19    /* parent */
-#endif
+       LOAD_PIC (TREG)
[snip]

    2/ and may be also some SYS_ify like :
-       ldi     __NR_clone,%r20
+       ldi             SYS_ify (clone), %r20


But that's just some change in writing. Otoh, I much more worry of some
functional detail:
[snip]
+	/* Something bad happened -- no child created */
+.Lerror:
+
+	/* Set errno, save ret0 so we return with that value. */
+	copy	%ret0, %r3
 	b	__syscall_error
 	sub     %r0,%ret0,%arg0
+	copy	%r3, %ret0
+	/* Return after setting errno, and restoring ret0 */
+	bv	%r0(%rp)
+	ldwm	-64(%sp), %r3
[snip]

The idea is about "b	__syscall_error".

Afaik, this would be actualy translated as "b,l __syscall_error, r0"?

If yes (as test makes me believe), you would lost rp and __syscall_error(=
)
couldn't return to "copy r3,ret0"?

Thanks in advance for your attention,
    Joel

=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
