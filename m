From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH: parisc] Update futex.h
Date: Sat, 21 May 2016 15:03:54 -0400
Message-ID: <36FADD1C-5A9A-4BF5-832F-4D76944E4D40@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-11-218930213
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-11-218930213
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The attached patch updates the parisc version of futex.h to match the =
current generic implementation
except for the spinlock code.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---


--Apple-Mail-11-218930213
Content-Disposition: attachment;
	filename=futex.h.d.txt
Content-Type: text/plain;
	name="futex.h.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/futex.h =
b/arch/parisc/include/asm/futex.h
index 49df148..ac8bd58 100644
--- a/arch/parisc/include/asm/futex.h
+++ b/arch/parisc/include/asm/futex.h
@@ -35,70 +35,57 @@ static inline int
 futex_atomic_op_inuser (int encoded_op, u32 __user *uaddr)
 {
 	unsigned long int flags;
-	u32 val;
 	int op =3D (encoded_op >> 28) & 7;
 	int cmp =3D (encoded_op >> 24) & 15;
 	int oparg =3D (encoded_op << 8) >> 20;
 	int cmparg =3D (encoded_op << 20) >> 20;
-	int oldval =3D 0, ret;
+	int oldval, ret;
+	u32 tmp;
+
 	if (encoded_op & (FUTEX_OP_OPARG_SHIFT << 28))
 		oparg =3D 1 << oparg;
=20
 	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(*uaddr)))
 		return -EFAULT;
=20
+	_futex_spin_lock_irqsave(uaddr, &flags);
 	pagefault_disable();
=20
-	_futex_spin_lock_irqsave(uaddr, &flags);
+	ret =3D -EFAULT;
+	if (unlikely(get_user(oldval, uaddr) !=3D 0))
+		goto out_pagefault_enable;
+
+	ret =3D 0;
+	tmp =3D oldval;
=20
 	switch (op) {
 	case FUTEX_OP_SET:
-		/* *(int *)UADDR2 =3D OPARG; */
-		ret =3D get_user(oldval, uaddr);
-		if (!ret)
-			ret =3D put_user(oparg, uaddr);
+		tmp =3D oparg;
 		break;
 	case FUTEX_OP_ADD:
-		/* *(int *)UADDR2 +=3D OPARG; */
-		ret =3D get_user(oldval, uaddr);
-		if (!ret) {
-			val =3D oldval + oparg;
-			ret =3D put_user(val, uaddr);
-		}
+		tmp +=3D oparg;
 		break;
 	case FUTEX_OP_OR:
-		/* *(int *)UADDR2 |=3D OPARG; */
-		ret =3D get_user(oldval, uaddr);
-		if (!ret) {
-			val =3D oldval | oparg;
-			ret =3D put_user(val, uaddr);
-		}
+		tmp |=3D oparg;
 		break;
 	case FUTEX_OP_ANDN:
-		/* *(int *)UADDR2 &=3D ~OPARG; */
-		ret =3D get_user(oldval, uaddr);
-		if (!ret) {
-			val =3D oldval & ~oparg;
-			ret =3D put_user(val, uaddr);
-		}
+		tmp &=3D ~oparg;
 		break;
 	case FUTEX_OP_XOR:
-		/* *(int *)UADDR2 ^=3D OPARG; */
-		ret =3D get_user(oldval, uaddr);
-		if (!ret) {
-			val =3D oldval ^ oparg;
-			ret =3D put_user(val, uaddr);
-		}
+		tmp ^=3D oparg;
 		break;
 	default:
 		ret =3D -ENOSYS;
 	}
=20
-	_futex_spin_unlock_irqrestore(uaddr, &flags);
+	if (ret =3D=3D 0 && unlikely(put_user(tmp, uaddr) !=3D 0))
+		ret =3D -EFAULT;
=20
+out_pagefault_enable:
 	pagefault_enable();
+	_futex_spin_unlock_irqrestore(uaddr, &flags);
=20
-	if (!ret) {
+	if (ret =3D=3D 0) {
 		switch (cmp) {
 		case FUTEX_OP_CMP_EQ: ret =3D (oldval =3D=3D cmparg); =
break;
 		case FUTEX_OP_CMP_NE: ret =3D (oldval !=3D cmparg); =
break;
@@ -112,12 +99,10 @@ futex_atomic_op_inuser (int encoded_op, u32 __user =
*uaddr)
 	return ret;
 }
=20
-/* Non-atomic version */
 static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
-	int ret;
 	u32 val;
 	unsigned long flags;
=20
@@ -137,17 +122,20 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 =
__user *uaddr,
 	 */
=20
 	_futex_spin_lock_irqsave(uaddr, &flags);
+	if (unlikely(get_user(val, uaddr) !=3D 0)) {
+		_futex_spin_unlock_irqrestore(uaddr, &flags);
+		return -EFAULT;
+	}
=20
-	ret =3D get_user(val, uaddr);
-
-	if (!ret && val =3D=3D oldval)
-		ret =3D put_user(newval, uaddr);
+	if (val =3D=3D oldval && unlikely(put_user(newval, uaddr) !=3D =
0)) {
+		_futex_spin_unlock_irqrestore(uaddr, &flags);
+		return -EFAULT;
+	}
=20
 	*uval =3D val;
--Apple-Mail-11-218930213--
