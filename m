Return-Path: <pinotj@club-internet.fr>
Received: from relay-5m.club-internet.fr (relay-5m.club-internet.fr
	[194.158.104.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25C024829
	for <parisc-linux@parisc-linux.org>;
	Sat, 20 Mar 2004 02:02:18 -0700 (MST)
From: pinotj@club-internet.fr
To: parisc-linux@parisc-linux.org
Date: Sat, 20 Mar 2004 10:02:16 CET
Mime-Version: 1.0
Message-Id: <mnet2.1079773336.27405.pinotj@club-internet.fr>
Content-Type: text/plain; charset=ISO-8859-1
Cc: willy@debian.org, joey@infodrom.org, ajwalker@broadpark.no
Subject: [parisc-linux] Re: [DOC] Linux
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Thanks a lot for your answers. Seems that PA-RISC linux community are quit=
e reactive :-)

Some people ask me about the complete file, it's not on Internet yet so I =
first post it here. There is probably a lot of modifications to do but it'=
s a good start.

Regards,

Jerome Pinot


diff -Nru a/Documentation/Arch b/Documentation/Arch
--- a/Documentation/Arch	1970-01-01 09:00:00.000000000 +0900
+++ b/Documentation/Arch	2004-03-17 14:14:11.000000000 +0900
=40=40 -0,0 +1,444 =40=40
+
+March 2004		Supported architectures for Linux	v2.6.4
+			=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=
=7E=7E=7E=7E=7E=7E=7E=7E=7E
+
+
+The following is a quite complete list of all the architectures supported
+by Linux. Of course, you will find here Alpha, ARM, ARM26, CRIS, H8300,
+i386, IA-64, M68000, MIPS, PA-RISC, PPC, S/390, SuperH, SPARC, v850 and
+x86-64. But you will find too a complete list of CPUs and board supported
+by the kernel. For each part, first list means =22board=22 and second one
+means =22CPU=22.
+
+
+ Content:
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	1. i386		7. IA-64		13. S/390 (32/64)
+	2. Alpha	8. M68K			14. SuperH
+	3. ARM		9. MIPS (32/64, LE/BE)	15. SPARC
+	4. ARM26	10. PA-RISC (32/64)	16. UltraSPARC
+	5. CRIS		11. PPC			17. v850
+	6. H8300	12. PPC64		18. x86-64
+	=

+  =

+
+ 1. i386
+ =7E=7E=7E=7E=7E=7E=7E
+	AMD Elan
+	NUMAQ (IBM/Sequent)
+	PC-compatible	(generic)
+	SGI 320/540 (Visual Workstation)
+	Summit/EXA (IBM x440)
+	Unisys ES7000 IA32
+	Voyager (NCR)
+	generic SMP
+	generic SMP with more than 8 CPUs
+		=

+		AMD 386DX/DXL/SL/SLC/SX
+		AMD 486DX/DX2/DX4/SL/SLC/SLC2/SLC3/SX/SX2
+		AMD Elan
+		AMD K5
+		AMD K6/K6-II/K6-III
+		AMD K7/Athlon/Duron/Thunderbird
+		AMD K8/Athlon64/Hammer/Opteron
+		Cyrix 386DX/DXL/SL/SLC/SX
+		Cyrix 486DLC/DLC2/DX/DX2/DX4/SL/SLC/SLC2/SLC3/SX/SX2
+		Cyrix III
+		IBM 486DX/DX2/DX4/SL/SLC/SLC2/SLC3/SX/SX2
+		IDT Winchip
+		IDT Winchip 2
+		IDT Winchip 2A/3
+		Intel 386DX/DXL/SL/SLC/SX
+		Intel 486DX/DX2/DX4/SL/SLC/SLC2/SLC3/SX/SX2
+		Intel Celeron (Coppermine)
+		Intel Celeron (P4-based)
+		Intel Celeron (pre-Coppermine)
+		Intel Pentium
+		Intel Pentium (without TSC)
+		Intel Pentium 4/4 M/4 Xeon
+		Intel Pentium II
+		Intel Pentium III/III Xeon
+		Intel Pentium M
+		Intel Pentium MMX =

+		Intel Pentium Pro
+		NexGen Nx586
+		TI 486DLC/DLC2
+		Transmeta Crusoe
+		UMC 486SX-S
+		UMC U5D/U5S
+		VIA C3
+		VIA C3-2 (Nehemia)
+		generic x86
+
+  (see Documentation/i386)
+
+ 2. Alpha
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	Alcor/Alpha-XLT	(AS 600)
+	Alpha-XL	(XL-233, XL-266)
+	AlphaBook1	(Alpha laptop)
+	Avanti		(AS 200, AS 205, AS 250, AS 255, AS 300, AS 400)
+	Cabriolet	(AlphaPC64, AlphaPCI64)
+	DP264		(DP264)
+	EB164		(EB164 21164 evaluation board)
+	EB64+		(EB64+ 21064 evaluation board)
+	EB66		(EB66 21066 evaluation board)
+	EB66+		(EB66+ 21066 evaluation board)
+	Eiger		(OEM, Typhoon/Tsunami chipset)
+	Jensen		(DECpc 150, DEC 2000 model 300, DEC 2000 model 500)
+	LX164		(AlphaPC164-LX)
+	Lynx		(AS 2100A)
+	Marvel		(AlphaServer ES47/ES80/GS1280)
+	Miata		(Personal Workstation 433a/au, 500a/au, 600a/au)
+	Mikasa		(AS 1000)
+	Nautilus	(AMD 751 & ALI 1543C chipset)
+	Noritake	(AS 1000A, AS 600A, AS 800)
+	PC164		(AlphaPC164)
+	Platform2000	=

+	Rawhide		(AS 1200, AS 4000, AS 4100)
+	Ruffian		(RPX164-2, AlphaPC164-UX, AlphaPC164-BX)
+	RX164		=

+	SX164		(AlphaPC164-SX)
+	Sable		(AS 2000, AS 2100)
+	Shark		(DS 20L)
+	Takara		(Takara)
+	Titan		(AlphaServer ES45/DS25)
+	Wildfire	(AlphaServer GS 40/80/160/320)
+	generic
+   =

+  <http://www.alphalinux.org>
+
+ 3. ARM
+ =7E=7E=7E=7E=7E=7E
+	ADIFCC-based
+	Anakin			(StrongARM based SA110)
+	CLPS711x/EP721x-based
+	Cirrus-CL-PS7500FE
+	Co-EBSA285
+	EBSA-110		(StrongARM from Digital)
+	Epxa10db		(Altera's Excalibur XA10)
+	FootBridge
+	IOP3xx-based
+	Integrator
+	LinkUp-L7200		(ARM720T processor)
+	PXA250/210-based
+	Risc-PC			(Acorn)
+	SA1100-based
+	Shark
+	=

+  (see Documentation/arm)
+  <http://www.arm.linux.org.uk>
+
+ 4. ARM26
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	Acorn A5000		=

+	Acorn Archimedes (ARM2)
+
+ 5. CRIS
+ =7E=7E=7E=7E=7E=7E=7E
+	CRIS V32 (200LX)
+	ETRAX 100LX version 1
+	ETRAX 100LX version 2
+	xsim ETRAX simulator (100LX)
+
+  (see Documentation/cris)
+
+ 6. H8300
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	Flashmicom AE-3068/69		(Evaluation Board)
+ 	Flashmicom AKI-H8/3068F		(LAN Board)
+	Flashmicom AKI-H8/3069F		(LAN Board)
+	H8/300H	Simulator		(GDB Simulator)
+	H8MAX				(Evaluation Board)
+	H8S Simulator			(GDB Simulator)
+	Renesas EDOSK-2674R		(Evaluation Board)
+
+		H8/3001,3002,3003
+		H8/3006,3007
+		H8/3044,3045,3046,3047,3048,3052
+		H8/3065,3066,3067,3068,3069
+		H8S/2670,2673,2674R,2675,2676
+
+  (to use with uClinux)
+
+ 7. IA-64
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	DIG-compliant	(Developer's Interface Guide compliant)
+	HP-zx1/sx1000	(HP systems)
+	SGI-SN2		(SGI Altix systems)
+	Ski-simulator	(HP simulator)
+	=

+		Intel Itanium
+		Intel Itanium 2 (McKinley)
+
+  (see Documentation/ia64)
+  <http://www.linuxia64.org>
+
+ 8. M68k
+ =7E=7E=7E=7E=7E=7E=7E
+	Amiga
+	Apollo		(MC680x0-based, as the DN3500)
+	Atari		(68000-based, including the TT, Falcon and Medusa)
+	BVM Ltd. VME	(680x0 based as BVME4000, BVME6000)
+	HP9000/300
+	Hades		(Hades Atari clone)
+	Macintosh	(Apple Macintosh series)
+ 	Sun 3		(3/50, 3/60, 3/1xx, 3/2xx systems)
+	Sun 3x
+	Motorola VME	(680x0 based as MVME147, MVME162, MVME166, MVME167, =

+				MVME172, and MVME177)
+	Motorola Q40/60	(68040-based)
+	=

+		MC68020
+		MC68030
+		MC68040
+		MC68060
+	no MMU:
+		Motorola MC68EZ328
+		Motorola MC68VZ328
+		Motorola MC68328
+		Motorola MC68360
+		Motorola MCF5206 (ColdFire)
+		Motorola MCF5206e (ColdFire)
+		Motorola MCF5249 (ColdFire)
+		Motorola MCF5272 (ColdFire)
+		Motorola MCF5282 (ColdFire)
+		Motorola MCF5307 (ColdFire)
+		Motorola MCF5407 (ColdFire)
+
+  (see Documentation/m68k)
+	=

+ 9. MIPS (32/64, LE/BE)
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	ACER PICA
+	AMD/Alchemy Au1x00 	(PB1000/1100/1500)
+	AMD/Alchemy Au1x00 	(DB1000/1100/1500)
+	AMD/Alchemy Au1x00 	(Bosporus, Mirage)
+	AMD/Alchemy Au1x00 	(MyCable XXS1500, 4G Systems MTX-1)
+	Atlas board		(QED R5231-based)
+	Baget series		(Russian embedded system)
+	Broadcom BCM1xxx 	(BCM91250A-SWARM, BCM91250E-Sentosa)
+	Broadcom BCM1xxx 	(BCM91125E-Rhone, BCM91120x-Carmel)
+	Broadcom BCM1xxx 	(BCM91250PT-PTSWARM, BCM91250C2-LittleSur)
+	Broadcom BCM1xxx 	(BCM91120C-CRhine, BCM91125C-CRhone, generic)
+	CASIO CASSIOPEIA E-10/15/55/65
+	Cobalt Server
+	DECstations		(2100, 3100, 5000 family, 5900 family)
+	Galileo EV64120		(Evaluation board, MIPS R5000 compatible)
+	Galileo EV96100		(Evaluation board, MIPS R5000 compatible)
+	Galileo Technology	(GT96100 communications controller card)
+	Globspan IVR		(QED RM5231 R5000 MIPS core)
+	Hewlett Packard		(LaserJet board)
+	IBM WorkPad z50
+	ITE 8172G	=

+	ITE 8172SBC
+	Jazz Family		(R4030 chipset)
+	LASAT Networks platforms
+	Malta board
+	MIPS Magnum 4000
+	MIPS Millenium
+	Momentum Jaguar board
+	Momentum Ocelot board
+	Momentum Ocelot-C board
+	Momentum Ocelot-G board
+	NEC DDB Vrc-5074	(VR5000-based)
+	NEC DDB Vrc-5076	(R5432-based)
+	NEC DDB Vrc-5477	(R5432-based)
+	NEC Eagle/Hawk board
+	NEC Osprey board
+	NEC VR41XX
+	Olivetti M700-10
+	PMC-Sierra Yosemite	(evaluation board)
+	Rockhopper board	(R5432/R5500)
+	SolutionGear board	(R5432/R5500)
+	SEAD board
+	SGI IP22		(Indy/Indigo2)
+	SGI IP27		(Origin200/2000)
+	SGI IP32		(O2)
+	SNI RM200 PCI
+	TANBAC TB0219		(base board)
+	TANBAC TB0226		(Mbase)
+	TANBAC TB0229		(VR4131DIMM)
+	Toshiba JMR-TX3927
+	Victor MP-C303/304
+	ZAO Networks Capcella
+
+		R3000
+		R39XX
+		R41xx
+		R4300
+		R4x00	(including 4000/4400/4600/4700)
+		R49XX
+		R5000
+		R52xx	(Nevada)
+		R6000
+		R6000A
+		RM7000
+		R8000	(incomplete support)
+		R10000
+		RM9000
+		SB1
+		=

+  (see Documentation/mips)
+  <http://www.linux-mips.org/>
+
+ 10. PA-RISC (32/64)
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	PA-7000         (PCX-S)
+	PA-7100/PA-7150 (PCX-T)
+	PA-7100LC       (PCX-L)
+	PA-7200         (PCX-T')
+	PA-7300LC       (PCX-L2)
+	PA-8000         (PCX-U)
+	PA-8200         (PCX-U+)
+	PA-8500         (PCX-W)
+	PA-8600         (PCX-W+)
+	PA-8700         (PCX-W2)
+
+	705, 710, 720, 730, 750
+       712, 715, 725, 735, 755
+       B, C, J class workstations
+       D, K, R, A, L, N class servers and rpXXXX servers
+       T and V class servers are not supported
+       Superdome will need some additional work.
+
+  (see Documentation/parisc)
+  <http://www.parisc-linux.org>
+
+ 11. PowerPC
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+ 	Amiga PowerUP		(APUS)
+	BSE-IP
+	Cogent Willow
+	Dependable Compt. Syst.	(SM850)
+	Galileo			(EV-64260-BP)
+	IBM			(Spruce)
+	IKENDI AG		(FPS850L)
+	MicroSys		(IP860)
+	Motorola		(LoPEC, MCPN765, MVME5100)
+	Motorola		(PowerPlus, PrPMC750, PrPMC800)
+	Motorola CPM		(MPC8260)
+	Motorola MBX		(MPC821 and MPC860)
+	Motorola Sandpoint X3 	(any flavor)
+	Motorola WinCept 	(MPC821)
+	Multidata		(HERMES)
+ 	RPX-Lite		(PC104 form-factor SBC based on the MPC823)
+	RPX-Classic		(Credit-card-size SBC based on the MPC860)
+	RPX-Super
+	SBS-Adirondack
+	SBS-K2
+	SBS-Palomar4
+	SBS8260
+	Siemens AG		(PCU=5FE)
+	Speech Design		(SPD823TS, IVMS8, IVML24)
+	Synergy Microsystems 	(Gemini)
+	TQ Components		(TQM823L/850L/855L/860L)
+	TQ Components		(TQM8260)
+	Wind River Systems 	(EST8260)
+	=

+ 		601, 603, 604
+		740, 750, 7400
+		IBM 403, 405
+		IBM 970 (G5)
+		Motorola 821, 823, 850, 855, 860, 8260
+		POWER 3, POWER4
+ =

+  (see Documentation/powerpc)
+ =

+ 12. PowerPC 64
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	iSeries
+	pSeries / PowerMac G5
+	=

+  (see Documentation/powerpc)
+
+ 13. S/390 (32/64)
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	IBM eServer zSeries model z800 and z900
+	IBM eServer zSeries model z990
+	S/390 model G5 and G6
+
+  (see Documentation/s390)
+
+ 14. SuperH
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	ADX
+	BigSur
+	CAT68701
+	CqREEK			(SH7708 or SH7750)
+ 	DataMyte 4000		(Industrial Digital Assistant)
+	Eclipse International 	(EC3104 as Harris AD2000)
+	Hitachi			(SH7709, SH7750, SH7751)
+	HP jornada		(HP620, HP680, HP690)
+	MPC1211
+	Renesas SystemH		(7751R)
+	SEGA Dreamcast
+	SEGA Saturn
+	SH2000			(SH7709A)
+	STB1=5FHarp
+	STB1=5FOverdrive
+	SnapGear SH		(SecureEdge5410)
+	generic
+
+		SH-2
+			SH7604
+		SH-3
+			SH7300
+			SH7707
+			SH7708
+			SH7709
+		SH-4
+			SH7750
+			SH7751/SH7751R
+			SH7760
+			ST40STB1
+
+  (see Documentation/sh)
+  <http://www.linux-sh.org>
+
+ 15. SPARC
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E
+ 	Sun 4
+	generic
+
+  (see Documentation/sparc)
+ <http://www.ultralinux.org>
+
+ 16. UltraSPARC
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+	generic
+
+  (see Documentation/sparc)
+  <http://www.ultralinux.org>
+
+ 17. v850
+ =7E=7E=7E=7E=7E=7E=7E=7E
+	AS85EP1
+	Anna
+	GDB
+	RTE-V850E/MA1-CB
+	RTE-V850E/NB85E-CB
+	RTE-V850E/ME2-CB
+	sim85e2c
+	sim85e2s
+	NA85E2C-FPGA
+
+  (to use with uClinux)
+  =

+ 18. x86-64
+ =7E=7E=7E=7E=7E=7E=7E=7E=7E=7E
+ 	AMD K8/Opteron/Athlon64
+	Intel x86-64
+	generic
+
+  (see Documentation/x86=5F64)
+  <http://www.x86-64.org>
+  =

+=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
+Written by Jerome Pinot <pinotj AT club-internet DOT fr> the 14/03/2004
+Modified by =

+  <willy AT debian DOT org>
+  <joey AT infodrom DOT org>
+  <macro AT ds2.pg.gda DOT pl>
+  <ajwalker AT broadpark DOT no>
+
