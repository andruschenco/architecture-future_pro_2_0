# Каталог доменных событий

## Медицина

| Событие                | Контекст     | Описание                 | Контракт                                                             |
|------------------------|--------------|--------------------------|----------------------------------------------------------------------|
| `AppointmentCreated`   | Appointment  | Создан новый приём       | `{ appointment_id, patient_id, doctor_id, datetime, clinic_id }`     |
| `AppointmentCancelled` | Appointment  | Приём отменён            | `{ appointment_id, reason, cancelled_at }`                           |
| `PatientArrived`       | Appointment  | Пациент прибыл в клинику | `{ appointment_id, arrived_at }`                                     |
| `DiagnosisCompleted`   | Diagnosis    | Диагноз поставлен        | `{ diagnosis_id, appointment_id, doctor_id, icd_code, description }` |
| `PrescriptionCreated`  | Prescription | Назначено лечение        | `{ prescription_id, diagnosis_id, medications[], procedures[] }`     |

## Финтех

| Событие            | Контекст  | Описание         | Контракт                                                        |
|--------------------|-----------|------------------|-----------------------------------------------------------------|
| `InvoiceCreated`   | Invoice   | Выставлен счёт   | `{ invoice_id, appointment_id, customer_id, amount, currency }` |
| `PaymentProcessed` | Invoice   | Платёж проведён  | `{ invoice_id, payment_id, amount, processed_at }`              |
| `InvoiceOverdue`   | Invoice   | Просрочка оплаты | `{ invoice_id, overdue_days }`                                  |
| `CreditApplied`    | Credit    | Заявка на кредит | `{ credit_id, customer_id, amount, term }`                      |
| `CreditApproved`   | Credit    | Кредит одобрен   | `{ credit_id, approved_amount, rate }`                          |
| `BalanceUpdated`   | Account   | Баланс изменён   | `{ account_id, new_balance, transaction_id }`                   |

## ИИ-сервисы

| Событие             | Контекст        | Описание           | Контракт                                                      |
|---------------------|-----------------|--------------------|---------------------------------------------------------------|
| `AnalysisRequested` | AnalysisRequest | Запрошен ML-анализ | `{ analysis_id, prescription_id, data_type, file_url }`       |
| `AnalysisStarted`   | AnalysisRequest | Анализ запущен     | `{ analysis_id, model_id, started_at }`                       |
| `AnalysisCompleted` | AnalysisRequest | Анализ завершён    | `{ analysis_id, model_id, result, confidence, completed_at }` |

## CRM

| Событие           | Контекст  | Описание                | Контракт                                    |
|-------------------|-----------|-------------------------|---------------------------------------------|
| `CustomerCreated` | Customer  | Новый клиент            | `{ customer_id, name, email, phone, type }` |
| `CustomerUpdated` | Customer  | Данные клиента изменены | `{ customer_id, changed_fields[] }`         |
| `CustomerMerged`  | Customer  | Дубликаты объединены    | `{ primary_id, merged_id }`                 |

## Персонал

| Событие                 | Контекст  | Описание                  | Контракт                       |
|-------------------------|-----------|---------------------------|--------------------------------|
| `DoctorScheduleUpdated` | Schedule  | Изменено расписание врача | `{ doctor_id, date, slots[] }` |

## Инвентаризация

| Событие         | Контекст  | Описание              | Контракт                                       |
|-----------------|-----------|-----------------------|------------------------------------------------|
| `StockDepleted` | Stock     | Лекарство закончилось | `{ item_id, current_stock }`                   |
| `OrderPlaced`   | Order     | Заказ поставщику      | `{ order_id, item_id, quantity, supplier_id }` |

## Подписчики на события

| Событие              | Источник   | Подписчики                                           |
|----------------------|------------|------------------------------------------------------|
| `AppointmentCreated` | Медицина   | Финтех (создать счёт), Аналитика (пациентский поток) |
| `DiagnosisCompleted` | Медицина   | ИИ-сервисы (анализ), Аналитика                       |
| `AnalysisCompleted`  | ИИ-сервисы | Медицина (обновить карту), Аналитика                 |
| `InvoiceCreated`     | Финтех     | CRM (история), Аналитика                             |
| `PaymentProcessed`   | Финтех     | CRM, Аналитика                                       |
| `CustomerCreated`    | CRM        | Все домены                                           |
| `CustomerUpdated`    | CRM        | Все домены                                           |
