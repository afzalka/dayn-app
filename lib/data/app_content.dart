/// All static values shown in the app, taken verbatim from the XD design.
///
/// There is no backend yet: every screen reads its copy and sample data from
/// here, so wording or numbers can be changed in one place.
library;

// ---------------------------------------------------------------------------
// Models
// ---------------------------------------------------------------------------

class OnboardingPage {
  const OnboardingPage({required this.illustration, required this.tagline});
  final String illustration; // asset name under assets/icons/
  final String tagline; // two lines, joined with \n
}

class ActiveDebt {
  const ActiveDebt({
    required this.name,
    required this.icon,
    required this.remaining,
    required this.remainingFrom,
    required this.due,
    required this.paidPercent,
  });
  final String name;
  final String icon;
  final String remaining; // e.g. "OMR 100"
  final String remainingFrom; // e.g. "OMR 100"
  final String due; // e.g. "25th Dec 2026"
  final int paidPercent;
}

class CompletedDebt {
  const CompletedDebt({
    required this.name,
    required this.icon,
    required this.amount,
    required this.paidOn,
  });
  final String name;
  final String icon;
  final String amount;
  final String paidOn;
}

class Goal {
  const Goal({
    required this.name,
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    required this.total,
    required this.saved,
    required this.remaining,
    required this.percent,
    required this.target,
  });
  final String name;
  final String icon;
  final double iconWidth;
  final double iconHeight;
  final String total;
  final String saved;
  final String remaining;
  final int percent;
  final String target;
}

// ---------------------------------------------------------------------------
// Content
// ---------------------------------------------------------------------------

abstract final class AppContent {
  // Brand -------------------------------------------------------------------
  static const appName = 'Dayn';
  static const notificationCount = '2';

  // Arabic phrases ----------------------------------------------------------
  static const salam = 'السلام عليكم';
  static const bismillah = 'بسم الله الرحمن الرحيم';
  static const alhamdulillah = 'الْحَمْدُ لِلَّهِ';
  static const alhamdulillahTawfiq = 'الحمد لله وبالله التوفيق';
  static const biIdhnillah = 'بِإِذْنِ اللَّهِ';

  // Onboarding --------------------------------------------------------------
  static const onboarding = [
    OnboardingPage(
      illustration: 'illus_debts',
      tagline: 'a calmer way to\nmanage your debts.',
    ),
    OnboardingPage(
      illustration: 'illus_goals',
      tagline: 'a smarter way to Build\nyour goals.',
    ),
    OnboardingPage(
      illustration: 'illus_dua',
      tagline: 'Move forward by\nthe permission of Allah',
    ),
  ];
  static const getStarted = 'Get Started';
  static const alreadyHaveAccount = 'I already have an account';

  // Sign up / Sign in -------------------------------------------------------
  static const createAccount = 'Create Account';
  static const signUp = 'Sign Up';
  static const signIn = 'Sign in';
  static const fieldName = '*Name';
  static const fieldEmail = '*Email';
  static const fieldMobile = '*Mobile';
  static const fieldCountry = '*Country';
  static const fieldPassword = '*Password';
  static const fieldRepeatPassword = '*Repeat Password';
  static const fieldEmailOrMobile = '*Email/Mob';
  static const passwordHint =
      '*Use 8+ characters with letters, numbers, and a symbol.';

  // Home --------------------------------------------------------------------
  static const userFirstName = 'Fajar';
  static const homeGreeting = 'Hey $userFirstName! You’re getting Closer.';
  static const homeSubtitle = 'Every step matter. In Sha Allah.';
  static const debtProgressTitle = 'Your Debt Progress';
  static const debtProgressPercent = 75;
  static const debtPaid = 'OMR 750';
  static const debtRemaining = 'OMR 250';
  static const paidLabel = 'Paid';
  static const remainingLabel = 'Remaining';
  static const nextPaymentTitle = 'Your Next Payment';
  static const nextPaymentAmount = 'OMR 250';
  static const nextPaymentTo = 'To Ahamed';
  static const nextPaymentDue = 'Due 25 Sep 2026';
  static const recordPayment = 'Record payment';
  static const upcomingPaymentsTitle = 'Upcoming Payments';
  static const seeAll = 'See all';

  // My Debts ----------------------------------------------------------------
  static const myDebtsTitle = 'My Debts';
  static const activeDebtsTab = 'Active Debts (03)';
  static const completedDebtsTab = 'Completed (02)';
  static const addDebt = 'add debt';
  static const remainingFromLabel = 'Remaining From : ';
  static const dueLabel = 'Due: ';
  static const paidSuccessfully = 'Paid Succesfully';
  static const onLabel = 'On ';

  static const activeDebts = [
    ActiveDebt(
      name: 'Abdullah',
      icon: 'friends',
      remaining: 'OMR 100',
      remainingFrom: 'OMR 100',
      due: '25th Dec 2026',
      paidPercent: 0,
    ),
    ActiveDebt(
      name: 'Eesa',
      icon: 'friends',
      remaining: 'OMR 100',
      remainingFrom: 'OMR 200 ',
      due: '25th Dec 2026',
      paidPercent: 50,
    ),
    ActiveDebt(
      name: 'Grocery',
      icon: 'store',
      remaining: 'OMR 50',
      remainingFrom: 'OMR 200 ',
      due: '25th Dec 2026',
      paidPercent: 25,
    ),
  ];

  static const completedDebts = [
    CompletedDebt(
      name: 'Abdu Rahman',
      icon: 'friends',
      amount: 'OMR 500',
      paidOn: '25th November 2026',
    ),
    CompletedDebt(
      name: 'Yousuf',
      icon: 'friends',
      amount: 'OMR 250',
      paidOn: '25th November 2026',
    ),
    CompletedDebt(
      name: 'Yousuf',
      icon: 'friends',
      amount: 'OMR 250',
      paidOn: '25th November 2026',
    ),
  ];

  // Add debt, step 1 --------------------------------------------------------
  static const addDebtTitle = 'Add a new debt.';
  static const addDebtSubtitle1 = 'Record your debt clearly, stay on track.';
  static const quranQuote =
      '“O you who believe, When you contract a\ndebt for a specified term, write it down”\n- Qur’an 2:282';
  static const section1 = '1. Person Details';
  static const section2 = '2. Debt Details';
  static const section3 = '3. Date';
  static const fieldContactNumber = '*Contact number';
  static const currencyLabel = '*Currency';
  static const currency = 'OMR';
  static const totalAmountLabel = '*Total amount in (OMR)';
  static const amountPlaceholder = '0.000';
  static const repaymentTypeLabel = '*Type of repayment';
  static const fullPayment = 'Full payment';
  static const fullPaymentSub = 'One time Payment';
  static const installments = 'Installments';
  static const installmentsSub = 'Multiple Payments';
  static const purposeLabel = 'Purpose (Optional)';
  static const purposePlaceholder = 'e.g, Vehicle, Business, Personal, etc.';
  static const borrowedDateLabel = '*Borrowed date';
  static const dueDateLabel = '*Due Date';
  static const borrowedDate = '21 Sep 2026';
  static const dueDate = '21 Sep 2026';
  static const next = 'Next';

  // Add debt, step 2 --------------------------------------------------------
  static const addDebtSubtitle2 = 'Almost there, add few more details.';
  static const section4 = '4. Installment Details';
  static const numberOfInstallmentsLabel = 'Number of installments';
  static const numberOfInstallments = '12';
  static const installmentAmountLabel = 'Installment amount in (OMR)';
  static const installmentAmount = '100.000';
  static const totalLabel = 'Total';
  static const totalAmount = '1200.000';
  static const firstPaymentDateLabel = 'First payment date';
  static const firstPaymentDate = '25 Sep 2026';
  static const frequencyLabel = 'Frequency';
  static const frequency = 'Monthly';
  static const totalDurationLabel = 'Total duration';
  static const totalDuration = '12 months';
  static const lastPaymentDateLabel = 'Last payment date';
  static const lastPaymentDate = '25 Aug 2027';
  static const section5 = '5. Witness Details (Optional)';
  static const witnessNote = 'It is good to keep a record with witnesses.';
  static const witness1Label = 'Witness 1';
  static const contactNumberLabel = 'Contact number';
  static const phonePrefix = '+968';
  static const phonePlaceholder = '9X XXX XXX';
  static const addWitness = 'add witness';
  static const section6 = '6. Notes (Optional)';
  static const notesPlaceholder = 'add any additional notes….';
  static const notesCounter = '0/250';
  static const saveDebt = 'Save debt';

  // Debt saved --------------------------------------------------------------
  static const debtSavedTitle = 'Debts Saved!';
  static const debtSavedSubtitle = 'Your debt has been recorded clearly, $biIdhnillah.';
  static const savedDebtName = 'Ahamed';
  static const savedDebtPurpose = 'Personal';
  static const activeStatus = 'Active';
  static const totalAmountTitle = 'Total amount';
  static const savedDebtTotal = 'OMR 1,200';
  static const paymentTypeTitle = 'Payment type';
  static const savedDebtInstallments = '12 Installments';
  static const savedDebtPerMonth = 'OMR 100 per month';
  static const firstPaymentTitle = 'First payment';
  static const lastPaymentTitle = 'Last payment';
  static const savedDebtPaid = 'OMR 0';
  static const savedDebtRemaining = 'OMR 1200';
  static const savedDebtPercent = 0;
  static const savedDebtWitness = 'Abdu Rahman';
  static const savedDebtWitnessPhone = '+968 91 23 4567';
  static const purposeTitle = 'Purpose';
  static const viewDebt = 'View Debt';
  static const shareDebtRecord = 'Share debt record';
  static const done = 'Done';
  static const debtSavedFooter =
      'Keep your record safe and your repayment clear.\nIn shā’ Allāh.';

  // Goals -------------------------------------------------------------------
  static const myGoalsTitle = 'My Goals';
  static const goalsSubtitle = 'Plan today. for a better tomorrow\nIn Sha Allah';
  static const activeGoalsTab = 'Active goals (03)';
  static const completedGoalsTab = 'Completed (02)';
  static const savedLabel = 'Saved';
  static const targetLabel = 'Target: ';
  static const addGoal = 'add goal';

  static const goals = [
    Goal(
      name: 'Going to Umrah',
      icon: 'kaaba',
      iconWidth: 20,
      iconHeight: 27.17,
      total: 'OMR 500',
      saved: 'OMR 100',
      remaining: 'OMR 400',
      percent: 20,
      target: '25 Dec 2027',
    ),
    Goal(
      name: 'New Car',
      icon: 'car',
      iconWidth: 32.59,
      iconHeight: 25.57,
      total: 'OMR 4500',
      saved: 'OMR 0',
      remaining: 'OMR 4500',
      percent: 0,
      target: '25 Dec 2028',
    ),
    Goal(
      name: 'Gift for wife',
      icon: 'gift',
      iconWidth: 26.31,
      iconHeight: 27.39,
      total: 'OMR 250',
      saved: 'OMR 200',
      remaining: 'OMR 250',
      percent: 85,
      target: '25 Nov 2027',
    ),
  ];
}
