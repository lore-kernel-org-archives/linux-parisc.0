From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] gcc ICE PR29114 (was: 64-bit long double support.)
Date: Fri, 17 Nov 2006 16:12:35 -0500
Message-ID: <200611171612.36286.vapier@gentoo.org>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611171502.49875.vapier@gentoo.org>
	<20061117205126.GA15716@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_EXiXFo3EVKgtM2l"
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061117205126.GA15716@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_EXiXFo3EVKgtM2l
Content-Type: multipart/signed; boundary="nextPart13722945.0gQrkoDFji";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart13722945.0gQrkoDFji
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 17 November 2006 15:51, John David Anglin wrote:
> What we need to see is the backtrace when emit_move_sequence (or emit_insn)
> is called with operands that match those in the insn that causes the ICE
> below. This will localize the area of the problem.

updated trace with automatic pretty prints attached to each breakpoint
-mike

--nextPart13722945.0gQrkoDFji
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV4lxEFjO5/oN/WBAQJa2g//cFXsKKBubPmYplqfpkVs+dey48GJQtHB
AgWRQOo1jixQUQA/oFeckhpSBsEd/nZMlAtPHl6I72/Su1wGjzlDehCRfB37/7cJ
gCjJY0pu5XGu/w5vOOW/FaKe9fH1Iyhmzr8wz9stbDlpkPJiclO8jhLVGL8gRyUS
+SrSg00S1Ba9XjWhKnDJdDSgv1LFN/2sAN5mWdBzvJR4lGr4xMKPjenOFFAvNDep
E4LhG5WxR3ZV8Kxn2XosJry7DocSmi7npAWH8GeOaLdZlWq482eaYd9VF3WS+czb
5dDBFt1mXP7dPLs4Z6J6lrmtuZ6SENEQ1kWqBUHCSli9vGJK7yIDSsperxapmhRR
HWDW4VgASD3Nqq+AtvBRipmhqb8odXOuayM+kxPmjizyaEavSH3bZYu1hRxzVqIH
a6DnEqwUu7//0IFVq2bDBpiN2SkmJRbbrCS6fF1WByAjRHZSrkfafQyzCxkuNyur
GuCXa/DU4TaCXuGM52CyRDjUACRxgkxJPYqFkubZowLoJNYcxX++Oe/8DtT4oLDd
K1v5NGJ7gxlkIZCgSIYmIIRTiXFApGj3xbcdM9NiWNGwb5tgn6Mfhc73fzIxe82g
NQhwTxrKlDfHlBC99TJPqF1bJCLpFwTe7afpLPD5JTKin7eayQQatMKmXtgACO4E
EThkJhFNMnc=
=Gs5U
-----END PGP SIGNATURE-----

--nextPart13722945.0gQrkoDFji--

--Boundary-00=_EXiXFo3EVKgtM2l
Content-Type: text/plain;
  charset="iso-8859-1";
  name="gdb-run"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="gdb-run"

$ gdb
Using host libthread_db library "/lib/libthread_db.so.1".
Breakpoint 1 at 0x72eeea: file /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/config/pa/pa.c, line 1310.
Breakpoint 2 at 0x5878c5: file /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c, line 4433.
Breakpoint 3 at 0x587388: file /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c, line 4260.
Breakpoint 4 at 0x587670: file /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c, line 4354.
GNU C version 4.1.2 20061117 (prerelease) (hppa2.0-unknown-linux-gnu)
	compiled by GNU C version 4.1.1 (Gentoo 4.1.1-r2).
GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
Compiler executable checksum: 75c21c80b69b3dedab682219e007845e

Breakpoint 2, emit_insn (x=0x0) at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
(gdb) c
Continuing.

Breakpoint 1, emit_move_sequence (operands=0x70c27856bec0, mode=DImode, scratch_reg=0x0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/config/pa/pa.c:1310
1310	  register rtx operand0 = operands[0];
$1 = {code = MEM, mode = DImode, jump = 0, call = 1, unchanging = 0, volatil = 0, in_struct = 0, used = 0, 
  frame_related = 0, return_val = 1, u = {fld = {{rt_int = -1009418144, rt_uint = 3285549152, 
        rt_str = 0x3204c3d58060 "\"", rt_rtx = 0x3204c3d58060, rt_rtvec = 0x3204c3d58060, 
        rt_type = 3285549152, rt_addr_diff_vec_flags = {min_align = 96, base_after_vec = 0, 
          min_after_vec = 0, max_after_vec = 0, min_after_base = 0, max_after_base = 0, 
          offset_unsigned = 0, scale = 213}, rt_cselib = 0x3204c3d58060, rt_bit = 0x3204c3d58060, 
        rt_tree = 0x3204c3d58060, rt_bb = 0x3204c3d58060, rt_mem = 0x3204c3d58060, 
        rt_reg = 0x3204c3d58060}}, hwint = {54996046807136}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102673411, sig = {54996047739472, 0, 458786}}}}
$2 = {code = CONST_INT, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -554899859, rt_uint = 3740067437, 
        rt_str = 0x5deece66d <Address 0x5deece66d out of bounds>, rt_rtx = 0x5deece66d, 
        rt_rtvec = 0x5deece66d, rt_type = 3740067437, rt_addr_diff_vec_flags = {min_align = 109, 
          base_after_vec = 0, min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 0, 
          offset_unsigned = 1, scale = 236}, rt_cselib = 0x5deece66d, rt_bit = 0x5deece66d, 
        rt_tree = 0x5deece66d, rt_bb = 0x5deece66d, rt_mem = 0x5deece66d, rt_reg = 0x5deece66d}}, hwint = {
      25214903917}, rv = {cl = 1, sign = 1, signalling = 1, canonical = 0, uexp = 116877107, sig = {0, 0, 
        0}}}}
(gdb) 
Continuing.

Breakpoint 1, emit_move_sequence (operands=0x70c27856bb80, mode=DImode, scratch_reg=0x0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/config/pa/pa.c:1310
1310	  register rtx operand0 = operands[0];
$3 = {code = REG, mode = DImode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, used = 0, 
  frame_related = 0, return_val = 0, u = {fld = {{rt_int = 95, rt_uint = 95, 
        rt_str = 0x5f <Address 0x5f out of bounds>, rt_rtx = 0x5f, rt_rtvec = 0x5f, rt_type = 95, 
        rt_addr_diff_vec_flags = {min_align = 95, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x5f, 
        rt_bit = 0x5f, rt_tree = 0x5f, rt_bb = 0x5f, rt_mem = 0x5f, rt_reg = 0x5f}}, hwint = {95}, rv = {
      cl = 3, sign = 1, signalling = 1, canonical = 1, uexp = 2, sig = {95, 0, 0}}}}
$4 = {code = CONST_INT, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -554899859, rt_uint = 3740067437, 
        rt_str = 0x5deece66d <Address 0x5deece66d out of bounds>, rt_rtx = 0x5deece66d, 
        rt_rtvec = 0x5deece66d, rt_type = 3740067437, rt_addr_diff_vec_flags = {min_align = 109, 
          base_after_vec = 0, min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 0, 
          offset_unsigned = 1, scale = 236}, rt_cselib = 0x5deece66d, rt_bit = 0x5deece66d, 
        rt_tree = 0x5deece66d, rt_bb = 0x5deece66d, rt_mem = 0x5deece66d, rt_reg = 0x5deece66d}}, hwint = {
      25214903917}, rv = {cl = 1, sign = 1, signalling = 1, canonical = 0, uexp = 116877107, sig = {0, 0, 
        0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3e31740)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$5 = {code = SET, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527584, rt_uint = 3286439712, 
        rt_str = 0x3204c3e31720 "\"", rt_rtx = 0x3204c3e31720, rt_rtvec = 0x3204c3e31720, 
        rt_type = 3286439712, rt_addr_diff_vec_flags = {min_align = 32, base_after_vec = 1, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e31720, rt_bit = 0x3204c3e31720, 
        rt_tree = 0x3204c3e31720, rt_bb = 0x3204c3e31720, rt_mem = 0x3204c3e31720, 
        rt_reg = 0x3204c3e31720}}, hwint = {54996047697696}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701241, sig = {54996046949248, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 1, emit_move_sequence (operands=0x70c27856b8c0, mode=DImode, scratch_reg=0x0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/config/pa/pa.c:1310
1310	  register rtx operand0 = operands[0];
$6 = {code = REG, mode = DImode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, used = 0, 
  frame_related = 0, return_val = 0, u = {fld = {{rt_int = 95, rt_uint = 95, 
        rt_str = 0x5f <Address 0x5f out of bounds>, rt_rtx = 0x5f, rt_rtvec = 0x5f, rt_type = 95, 
        rt_addr_diff_vec_flags = {min_align = 95, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x5f, 
        rt_bit = 0x5f, rt_tree = 0x5f, rt_bb = 0x5f, rt_mem = 0x5f, rt_reg = 0x5f}}, hwint = {95}, rv = {
      cl = 3, sign = 1, signalling = 1, canonical = 1, uexp = 2, sig = {95, 0, 0}}}}
$7 = {code = PLUS, mode = DImode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, used = 0, 
  frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527584, rt_uint = 3286439712, 
        rt_str = 0x3204c3e31720 "\"", rt_rtx = 0x3204c3e31720, rt_rtvec = 0x3204c3e31720, 
        rt_type = 3286439712, rt_addr_diff_vec_flags = {min_align = 32, base_after_vec = 1, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e31720, rt_bit = 0x3204c3e31720, 
        rt_tree = 0x3204c3e31720, rt_bb = 0x3204c3e31720, rt_mem = 0x3204c3e31720, 
        rt_reg = 0x3204c3e31720}}, hwint = {54996047697696}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701241, sig = {54996046949264, 0, 54996046836352}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3e317a0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$8 = {code = SET, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527648, rt_uint = 3286439648, 
        rt_str = 0x3204c3e316e0 "\"", rt_rtx = 0x3204c3e316e0, rt_rtvec = 0x3204c3e316e0, 
        rt_type = 3286439648, rt_addr_diff_vec_flags = {min_align = 224, base_after_vec = 0, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e316e0, rt_bit = 0x3204c3e316e0, 
        rt_tree = 0x3204c3e316e0, rt_bb = 0x3204c3e316e0, rt_mem = 0x3204c3e316e0, 
        rt_reg = 0x3204c3e316e0}}, hwint = {54996047697632}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701239, sig = {54996047697760, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d5f2d0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$9 = {code = INSN, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = 9, rt_uint = 9, 
        rt_str = 0x9 <Address 0x9 out of bounds>, rt_rtx = 0x9, rt_rtvec = 0x9, rt_type = TImode, 
        rt_addr_diff_vec_flags = {min_align = 9, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x9, 
        rt_bit = 0x9, rt_tree = 0x9, rt_bb = 0x9, rt_mem = 0x9, rt_reg = 0x9}}, hwint = {9}, rv = {cl = 1, 
      sign = 0, signalling = 1, canonical = 0, uexp = 0, sig = {0, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d5f280)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$10 = {code = INSN, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = 8, rt_uint = 8, 
        rt_str = 0x8 <Address 0x8 out of bounds>, rt_rtx = 0x8, rt_rtvec = 0x8, rt_type = DImode, 
        rt_addr_diff_vec_flags = {min_align = 8, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x8, 
        rt_bit = 0x8, rt_tree = 0x8, rt_bb = 0x8, rt_mem = 0x8, rt_reg = 0x8}}, hwint = {8}, rv = {cl = 0, 
      sign = 0, signalling = 1, canonical = 0, uexp = 0, sig = {0, 54996046836432, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3e317e0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$11 = {code = SET, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527872, rt_uint = 3286439424, 
        rt_str = 0x3204c3e31600 "'", rt_rtx = 0x3204c3e31600, rt_rtvec = 0x3204c3e31600, 
        rt_type = 3286439424, rt_addr_diff_vec_flags = {min_align = 0, base_after_vec = 0, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e31600, rt_bit = 0x3204c3e31600, 
        rt_tree = 0x3204c3e31600, rt_bb = 0x3204c3e31600, rt_mem = 0x3204c3e31600, 
        rt_reg = 0x3204c3e31600}}, hwint = {54996047697408}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701232, sig = {54996047697632, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d5f280)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$12 = {code = INSN, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = 8, rt_uint = 8, 
        rt_str = 0x8 <Address 0x8 out of bounds>, rt_rtx = 0x8, rt_rtvec = 0x8, rt_type = DImode, 
        rt_addr_diff_vec_flags = {min_align = 8, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x8, 
        rt_bit = 0x8, rt_tree = 0x8, rt_bb = 0x8, rt_mem = 0x8, rt_reg = 0x8}}, hwint = {8}, rv = {cl = 0, 
      sign = 0, signalling = 1, canonical = 0, uexp = 0, sig = {0, 54996046836432, 0}}}}
(gdb) 
Continuing.

Breakpoint 1, emit_move_sequence (operands=0x70c27856c780, mode=SImode, scratch_reg=0x0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/config/pa/pa.c:1310
1310	  register rtx operand0 = operands[0];
$13 = {code = REG, mode = SImode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, used = 0, 
  frame_related = 0, return_val = 1, u = {fld = {{rt_int = 28, rt_uint = 28, 
        rt_str = 0x1c <Address 0x1c out of bounds>, rt_rtx = 0x1c, rt_rtvec = 0x1c, rt_type = 28, 
        rt_addr_diff_vec_flags = {min_align = 28, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x1c, 
        rt_bit = 0x1c, rt_tree = 0x1c, rt_bb = 0x1c, rt_mem = 0x1c, rt_reg = 0x1c}}, hwint = {28}, rv = {
      cl = 0, sign = 1, signalling = 1, canonical = 1, uexp = 0, sig = {28, 0, 54996047741248}}}}
$14 = {code = REG, mode = SImode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, used = 0, 
  frame_related = 0, return_val = 0, u = {fld = {{rt_int = 94, rt_uint = 94, 
        rt_str = 0x5e <Address 0x5e out of bounds>, rt_rtx = 0x5e, rt_rtvec = 0x5e, rt_type = 94, 
        rt_addr_diff_vec_flags = {min_align = 94, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0x5e, 
        rt_bit = 0x5e, rt_tree = 0x5e, rt_bb = 0x5e, rt_mem = 0x5e, rt_reg = 0x5e}}, hwint = {94}, rv = {
      cl = 2, sign = 1, signalling = 1, canonical = 1, uexp = 2, sig = {94, 54996046949216, 458786}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3e31800)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$15 = {code = SET, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527712, rt_uint = 3286439584, 
        rt_str = 0x3204c3e316a0 "\"", rt_rtx = 0x3204c3e316a0, rt_rtvec = 0x3204c3e316a0, 
        rt_type = 3286439584, rt_addr_diff_vec_flags = {min_align = 160, base_after_vec = 0, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e316a0, rt_bit = 0x3204c3e316a0, 
        rt_tree = 0x3204c3e316a0, rt_bb = 0x3204c3e316a0, rt_mem = 0x3204c3e316a0, 
        rt_reg = 0x3204c3e316a0}}, hwint = {54996047697568}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701237, sig = {54996047697504, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d5f370)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$16 = {code = INSN, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = 14, rt_uint = 14, 
        rt_str = 0xe <Address 0xe out of bounds>, rt_rtx = 0xe, rt_rtvec = 0xe, rt_type = CHImode, 
        rt_addr_diff_vec_flags = {min_align = 14, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0xe, 
        rt_bit = 0xe, rt_tree = 0xe, rt_bb = 0xe, rt_mem = 0xe, rt_reg = 0xe}}, hwint = {14}, rv = {cl = 2, 
      sign = 1, signalling = 1, canonical = 0, uexp = 0, sig = {0, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d7aba0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$17 = {code = CLOBBER, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527712, rt_uint = 3286439584, 
        rt_str = 0x3204c3e316a0 "\"", rt_rtx = 0x3204c3e316a0, rt_rtvec = 0x3204c3e316a0, 
        rt_type = 3286439584, rt_addr_diff_vec_flags = {min_align = 160, base_after_vec = 0, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e316a0, rt_bit = 0x3204c3e316a0, 
        rt_tree = 0x3204c3e316a0, rt_bb = 0x3204c3e316a0, rt_mem = 0x3204c3e316a0, 
        rt_reg = 0x3204c3e316a0}}, hwint = {54996047697568}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701237, sig = {0, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d7abb0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$18 = {code = CLOBBER, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527776, rt_uint = 3286439520, 
        rt_str = 0x3204c3e31660 "\"", rt_rtx = 0x3204c3e31660, rt_rtvec = 0x3204c3e31660, 
        rt_type = 3286439520, rt_addr_diff_vec_flags = {min_align = 96, base_after_vec = 0, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e31660, rt_bit = 0x3204c3e31660, 
        rt_tree = 0x3204c3e31660, rt_bb = 0x3204c3e31660, rt_mem = 0x3204c3e31660, 
        rt_reg = 0x3204c3e31660}}, hwint = {54996047697504}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701235, sig = {0, 0, 0}}}}
(gdb) 
Continuing.

Breakpoint 3, emit_insn_after (pattern=0x3204c3d5f3c0, after=0x3204c3e3c400)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4260
4260	  if (INSN_P (after))
$19 = {code = INSN, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = 15, rt_uint = 15, 
        rt_str = 0xf <Address 0xf out of bounds>, rt_rtx = 0xf, rt_rtvec = 0xf, rt_type = CSImode, 
        rt_addr_diff_vec_flags = {min_align = 15, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0xf, 
        rt_bit = 0xf, rt_tree = 0xf, rt_bb = 0xf, rt_mem = 0xf, rt_reg = 0xf}}, hwint = {15}, rv = {cl = 3, 
      sign = 1, signalling = 1, canonical = 0, uexp = 0, sig = {0, 54996046836752, 0}}}}
$20 = {code = NOTE, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = 11, rt_uint = 11, 
        rt_str = 0xb <Address 0xb out of bounds>, rt_rtx = 0xb, rt_rtvec = 0xb, rt_type = DFmode, 
        rt_addr_diff_vec_flags = {min_align = 11, base_after_vec = 0, min_after_vec = 0, max_after_vec = 0, 
          min_after_base = 0, max_after_base = 0, offset_unsigned = 0, scale = 0}, rt_cselib = 0xb, 
        rt_bit = 0xb, rt_tree = 0xb, rt_bb = 0xb, rt_mem = 0xb, rt_reg = 0xb}}, hwint = {11}, rv = {cl = 3, 
      sign = 0, signalling = 1, canonical = 0, uexp = 0, sig = {54996046836512, 54996046836272, 0}}}}
(gdb) 
Continuing.

Breakpoint 2, emit_insn (x=0x3204c3d7abc0)
    at /usr/local/src/gnu/gcc/branches/gcc-4_1-branch/gcc/emit-rtl.c:4433
4433	  rtx last = last_insn;
$21 = {code = USE, mode = VOIDmode, jump = 0, call = 0, unchanging = 0, volatil = 0, in_struct = 0, 
  used = 0, frame_related = 0, return_val = 0, u = {fld = {{rt_int = -1008527712, rt_uint = 3286439584, 
        rt_str = 0x3204c3e316a0 "\"", rt_rtx = 0x3204c3e316a0, rt_rtvec = 0x3204c3e316a0, 
        rt_type = 3286439584, rt_addr_diff_vec_flags = {min_align = 160, base_after_vec = 0, 
          min_after_vec = 1, max_after_vec = 1, min_after_base = 0, max_after_base = 1, 
          offset_unsigned = 0, scale = 227}, rt_cselib = 0x3204c3e316a0, rt_bit = 0x3204c3e316a0, 
        rt_tree = 0x3204c3e316a0, rt_bb = 0x3204c3e316a0, rt_mem = 0x3204c3e316a0, 
        rt_reg = 0x3204c3e316a0}}, hwint = {54996047697568}, rv = {cl = 0, sign = 0, signalling = 0, 
      canonical = 0, uexp = 102701237, sig = {0, 0, 0}}}}
(gdb) 
Continuing.
../seed48_r.i: In function 'main':
../seed48_r.i:1: error: unrecognizable insn:
(insn 9 8 10 1 (set (reg:DI 95)
        (plus:DI (reg:DI 96)
            (const_int -6547 [0xffffffffffffe66d]))) -1 (nil)
    (expr_list:REG_EQUAL (const_int 25214903917 [0x5deece66d])
        (nil)))
../seed48_r.i:1: internal compiler error: in extract_insn, at recog.c:2084
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.

Program exited with code 01.
(gdb) 

--Boundary-00=_EXiXFo3EVKgtM2l
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_EXiXFo3EVKgtM2l--
